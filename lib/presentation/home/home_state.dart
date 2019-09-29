import 'package:built_value/built_value.dart';
import 'package:chyc_sie_roboty/domain/data/course.dart';
import 'package:chyc_sie_roboty/domain/data/offer.dart';

part 'home_state.g.dart';

abstract class HomeState {
  String get userName;
}

abstract class ShowLoadingOfferCards implements Built<ShowLoadingOfferCards, ShowLoadingOfferCardsBuilder>, HomeState {
  ShowLoadingOfferCards._();

  @override
  String get userName;

  factory ShowLoadingOfferCards([updates(ShowLoadingOfferCardsBuilder b)]) = _$ShowLoadingOfferCards;
  static ShowLoadingOfferCards from(String name) => ShowLoadingOfferCards((b) => b
    ..userName = name);
}

abstract class ShowLoadingCourseCards
    implements Built<ShowLoadingCourseCards, ShowLoadingCourseCardsBuilder>, HomeState {
  ShowLoadingCourseCards._();

  @override
  String get userName;

  factory ShowLoadingCourseCards([updates(ShowLoadingCourseCardsBuilder b)]) = _$ShowLoadingCourseCards;
  static ShowLoadingCourseCards from(String name) => ShowLoadingCourseCards((b) => b
    ..userName = name);
}

abstract class ShowOfferCards implements Built<ShowOfferCards, ShowOfferCardsBuilder>, HomeState {
  ShowOfferCards._();

  List<Offer> get offers;

  @override
  String get userName;

  factory ShowOfferCards([updates(ShowOfferCardsBuilder b)]) = _$ShowOfferCards;

  static ShowOfferCards from(List<Offer> offers, String name) => ShowOfferCards((b) => b
    ..offers = offers
    ..userName = name);
}

abstract class ShowCourseCards implements Built<ShowCourseCards, ShowCourseCardsBuilder>, HomeState {
  ShowCourseCards._();

  List<Course> get courses;

  @override
  String get userName;

  factory ShowCourseCards([updates(ShowCourseCardsBuilder b)]) = _$ShowCourseCards;

  static ShowCourseCards from(List<Course> courses, String name) => ShowCourseCards((b) => b
    ..courses = courses
    ..userName = name);
}
