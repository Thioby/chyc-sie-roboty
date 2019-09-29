import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'course.jser.dart';

class Course {
  String id;
  final String courseLocalization;
  final String courseType;
  final String description;
  final String name;
  final String createdBy;

  Course(
    this.courseLocalization,
    this.courseType,
    this.description,
    this.name,
    this.createdBy,
  );
}

@GenSerializer()
class CourseSerializer extends Serializer<Course> with _$CourseSerializer {}
