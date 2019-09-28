import 'package:chyc_sie_roboty/domain/data/course.dart';
import 'package:chyc_sie_roboty/domain/data/offer.dart';
import 'package:rxdart/rxdart.dart';

abstract class DataRepository {
  Observable<List<Offer>> offers();

  Observable<List<Course>> courses();
}
