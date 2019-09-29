import 'package:built_value/built_value.dart';

part 'course_filters_event.g.dart';

abstract class CourseFiltersEvent {}

abstract class UpdateFilters implements Built<UpdateFilters, UpdateFiltersBuilder>, CourseFiltersEvent {
  UpdateFilters._();

  String get category;

  String get localization;

  factory UpdateFilters([updates(UpdateFiltersBuilder b)]) = _$UpdateFilters;

  static UpdateFilters from(String category, String localization) => UpdateFilters(
        (b) => b
          ..category = category
          ..localization = localization,
      );
}
