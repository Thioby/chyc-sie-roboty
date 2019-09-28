import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'main_state.g.dart';

abstract class MainState {}

abstract class ShowOffersButton implements Built<ShowOffersButton, ShowOffersButtonBuilder>, MainState {
  ShowOffersButton._();

  factory ShowOffersButton([updates(ShowOffersButtonBuilder b)]) = _$ShowOffersButton;
}

abstract class ShowCoursesButton implements Built<ShowCoursesButton, ShowCoursesButtonBuilder>, MainState {
  ShowCoursesButton._();

  factory ShowCoursesButton([updates(ShowCoursesButtonBuilder b)]) = _$ShowCoursesButton;
}