import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

class User {
  String uid;
  String name;
  bool isEmployer;
  @nullable
  String courseLocalization;
  @nullable
  String courseType;
  @nullable
  bool showPaidCourses;
  @nullable
  bool showCoursesWithCert;

  User(
      {this.uid,
      this.name,
      this.isEmployer,
      this.courseLocalization,
      this.courseType,
      this.showPaidCourses,
      this.showCoursesWithCert});
}
