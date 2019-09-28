import 'package:chyc_sie_roboty/domain/data/course.dart';
import 'package:chyc_sie_roboty/domain/data/data_repository.dart';
import 'package:chyc_sie_roboty/domain/data/offer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseDataRepository extends DataRepository {
  final Firestore _firestore;

  FirebaseDataRepository(this._firestore);

  @override
  Observable<List<Offer>> offers() => Observable(_firestore.collection('works').snapshots()).flatMap(
      (offers) => Observable.just(offers.documents.map((doc) => OfferSerializer().fromMap(doc.data)).toList()));

  @override
  Observable<List<Course>> courses() {}
}
