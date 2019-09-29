import 'package:chyc_sie_roboty/domain/auth/user_repository.dart';
import 'package:chyc_sie_roboty/domain/data/course.dart';
import 'package:chyc_sie_roboty/domain/data/data_repository.dart';
import 'package:chyc_sie_roboty/domain/data/offer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseDataRepository extends DataRepository {
  final Firestore _firestore;
  final UserRepository _userRepository;

  FirebaseDataRepository(this._firestore, this._userRepository);

  @override
  Observable<List<Offer>> offers() => Observable(_firestore.collection('works').snapshots()).flatMap((offers) =>
      Observable.just(offers.documents.map((doc) => OfferSerializer().fromMap(doc.data)..id = doc.documentID).toList()
        ..sort((a, b) => a.timestamp.compareTo(b.timestamp))));

  @override
  Observable<List<Course>> courses() {
    return Observable(_firestore.collection('courses').snapshots())
        .flatMap((courses) => Observable.just(
            courses.documents.map((doc) => CourseSerializer().fromMap(doc.data)..id = doc.documentID).toList()
              ..sort((a, b) => a.timestamp.compareTo(b.timestamp))))
        .flatMap((courses) => _userRepository.gimmeUser().flatMap((user) {
              List<Course> finalList = courses;
              if (user.courseLocalization != null && user.courseLocalization.isNotEmpty) {
                finalList = finalList.where((course) => course.courseLocalization == user.courseLocalization).toList();
              }
              if (user.courseType != null && user.courseType.isNotEmpty && user.courseType != "Dowolna") {
                finalList = finalList.where((course) => course.courseType == user.courseType).toList();
              }
              return Observable.just(finalList);
            }));
  }
}
