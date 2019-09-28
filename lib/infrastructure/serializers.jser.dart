// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserSerializer implements Serializer<User> {
  @override
  Map<String, dynamic> toMap(User model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'uid', model.uid);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'isEmployer', model.isEmployer);
    setMapValue(ret, 'courseLocalization', model.courseLocalization);
    setMapValue(ret, 'courseType', model.courseType);
    setMapValue(ret, 'showPaidCourses', model.showPaidCourses);
    setMapValue(ret, 'showCoursesWithCert', model.showCoursesWithCert);
    return ret;
  }

  @override
  User fromMap(Map map) {
    if (map == null) return null;
    final obj = User();
    obj.uid = map['uid'] as String;
    obj.name = map['name'] as String;
    obj.isEmployer = map['isEmployer'] as bool;
    obj.courseLocalization = map['courseLocalization'] as String;
    obj.courseType = map['courseType'] as String;
    obj.showPaidCourses = map['showPaidCourses'] as bool;
    obj.showCoursesWithCert = map['showCoursesWithCert'] as bool;
    return obj;
  }
}
