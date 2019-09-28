import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

class User {
  bool isLogged;
  String uid;
  String pushToken;
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

  User.nonLogged({this.isLogged = false});

  User(
      {this.isLogged = true,
      this.uid,
      this.pushToken,
      this.name,
      this.isEmployer,
      this.courseLocalization,
      this.courseType,
      this.showPaidCourses,
      this.showCoursesWithCert});
}
