import 'package:chyc_sie_roboty/domain/auth/user.dart';
import 'package:chyc_sie_roboty/domain/auth/user_repository.dart';
import 'package:chyc_sie_roboty/infrastructure/serializers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/src/observables/observable.dart';

const _USERS_COLLECTION = "users";

class FirebaseUserRepository implements UserRepository {
  final Firestore _firestore;

  FirebaseUserRepository(this._firestore);

  @override
  Observable login(FirebaseUser firebaseUser) {
    return Observable.fromFuture(_firestore.collection(_USERS_COLLECTION).document(firebaseUser.uid).get())
        .flatMap((document) {
      if (document.exists) {
        return Observable.just(null);
      } else {
        var user = User(
          uid: firebaseUser.uid,
          name: firebaseUser.displayName,
          isEmployer: false,
        );
        return Observable.fromFuture(
            document.reference.setData(UserSerializer().toMap(user)).timeout(Duration(seconds: 15)));
      }
    });
  }
}
