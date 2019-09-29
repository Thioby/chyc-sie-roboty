import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'course_filters_state.g.dart';

abstract class CourseFiltersState {}

abstract class ShowData implements Built<ShowData, ShowDataBuilder>, CourseFiltersState {
  ShowData._();

  factory ShowData([updates(ShowDataBuilder b)]) = _$ShowData;
}

abstract class ShowLoading implements Built<ShowLoading, ShowLoadingBuilder>, CourseFiltersState {
  ShowLoading._();

  factory ShowLoading([updates(ShowLoadingBuilder b)]) = _$ShowLoading;
}