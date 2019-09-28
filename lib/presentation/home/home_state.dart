import 'package:built_value/built_value.dart';
import 'package:chyc_sie_roboty/domain/data/course.dart';
import 'package:chyc_sie_roboty/domain/data/offer.dart';
import 'package:chyc_sie_roboty/presentation/home/swipe_type.dart';

part 'home_state.g.dart';

abstract class HomeState {}

abstract class ShowLoadingOfferCards implements Built<ShowLoadingOfferCards, ShowLoadingOfferCardsBuilder>, HomeState {
  ShowLoadingOfferCards._();

  factory ShowLoadingOfferCards([updates(ShowLoadingOfferCardsBuilder b)]) = _$ShowLoadingOfferCards;
}

abstract class ShowLoadingCourseCards implements Built<ShowLoadingCourseCards, ShowLoadingCourseCardsBuilder>, HomeState {
  ShowLoadingCourseCards._();

  factory ShowLoadingCourseCards([updates(ShowLoadingCourseCardsBuilder b)]) = _$ShowLoadingCourseCards;
}

abstract class ShowOfferCards implements Built<ShowOfferCards, ShowOfferCardsBuilder>, HomeState {
  ShowOfferCards._();

  List<Offer> get offers;

  factory ShowOfferCards([updates(ShowOfferCardsBuilder b)]) = _$ShowOfferCards;

  static ShowOfferCards from(List<Offer> offers) => ShowOfferCards((b) => b..offers = offers);
}

abstract class ShowCourseCards implements Built<ShowCourseCards, ShowCourseCardsBuilder>, HomeState {
  ShowCourseCards._();

  List<Course> get courses;

  factory ShowCourseCards([updates(ShowCourseCardsBuilder b)]) = _$ShowCourseCards;

  static ShowCourseCards from(List<Course> courses) => ShowCourseCards((b) => b..courses = courses);
}
