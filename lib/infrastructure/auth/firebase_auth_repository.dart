import 'package:chyc_sie_roboty/domain/auth/user.dart';
import 'package:chyc_sie_roboty/domain/auth/user_repository.dart';
import 'package:chyc_sie_roboty/infrastructure/serializers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fimber/fimber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/src/observables/observable.dart';

const _USERS_COLLECTION = "users";

class FirebaseUserRepository implements UserRepository {
  final Firestore _firestore;
  final FirebaseMessaging _firebaseMessaging;
  final BehaviorSubject userState = BehaviorSubject()..add(User.nonLogged());

  FirebaseUserRepository(this._firestore, this._firebaseMessaging);

  @override
  Observable login(FirebaseUser firebaseUser) {
    return Observable.fromFuture(_firestore.collection(_USERS_COLLECTION).document(firebaseUser.uid).get())
        .flatMap((document) {
      return Observable.fromFuture(_firebaseMessaging.getToken()).flatMap((token) {
        Fimber.d("registered fcm token: " + token);
        var user = User(
          uid: firebaseUser.uid,
          name: firebaseUser.displayName,
          isEmployer: false,
          pushToken: token,
        );
        return Observable.fromFuture(
                document.reference.setData(UserSerializer().toMap(user)).timeout(Duration(seconds: 15)))
            .map((_) => user);
      }).doOnData((user) {
        userState.add(user);
      });
    });
  }
}
