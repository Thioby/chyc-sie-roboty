import 'package:built_value/built_value.dart';

part 'home_event.g.dart';

abstract class HomeEvent {}

abstract class DiscardOffer implements Built<DiscardOffer, DiscardOfferBuilder>, HomeEvent {
  DiscardOffer._();

  int get id;

  factory DiscardOffer([updates(DiscardOfferBuilder b)]) = _$DiscardOffer;

  static DiscardOffer from(int id) => DiscardOffer((b) => b..id = id);
}

abstract class AcceptOffer implements Built<AcceptOffer, AcceptOfferBuilder>, HomeEvent {
  AcceptOffer._();

  int get id;

  factory AcceptOffer([updates(AcceptOfferBuilder b)]) = _$AcceptOffer;

  static AcceptOffer from(int id) => AcceptOffer((b) => b..id = id);
}

abstract class AcceptCourse implements Built<AcceptCourse, AcceptCourseBuilder>, HomeEvent {
  AcceptCourse._();

  int get id;

  factory AcceptCourse([updates(AcceptCourseBuilder b)]) = _$AcceptCourse;

  static AcceptCourse from(int id) => AcceptCourse((b) => b..id = id);
}

abstract class DiscardCourse implements Built<DiscardCourse, DiscardCourseBuilder>, HomeEvent {
  DiscardCourse._();

  int get id;

  factory DiscardCourse([updates(DiscardCourseBuilder b)]) = _$DiscardCourse;

  static DiscardCourse from(int id) => DiscardCourse((b) => b..id = id);
}

abstract class ChangeDataType implements Built<ChangeDataType, ChangeDataTypeBuilder>, HomeEvent {
  ChangeDataType._();

  factory ChangeDataType([updates(ChangeDataTypeBuilder b)]) = _$ChangeDataType;
}