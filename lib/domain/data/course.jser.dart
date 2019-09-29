// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$CourseSerializer implements Serializer<Course> {
  @override
  Map<String, dynamic> toMap(Course model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'courseLocalization', model.courseLocalization);
    setMapValue(ret, 'courseType', model.courseType);
    setMapValue(ret, 'description', model.description);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'createdBy', model.createdBy);
    return ret;
  }

  @override
  Course fromMap(Map map) {
    if (map == null) return null;
    final obj = Course(
        map['courseLocalization'] as String ??
            getJserDefault('courseLocalization'),
        map['courseType'] as String ?? getJserDefault('courseType'),
        map['description'] as String ?? getJserDefault('description'),
        map['name'] as String ?? getJserDefault('name'),
        map['createdBy'] as String ?? getJserDefault('createdBy'));
    obj.id = map['id'] as String;
    return obj;
  }
}
