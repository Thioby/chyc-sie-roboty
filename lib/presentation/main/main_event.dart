import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:chyc_sie_roboty/presentation/home/swipe_type.dart';

part 'main_event.g.dart';

abstract class MainEvent {}

abstract class ChangeSwipeType implements Built<ChangeSwipeType, ChangeSwipeTypeBuilder>, MainEvent {
  ChangeSwipeType._();

  SwipeType get type;

  factory ChangeSwipeType([updates(ChangeSwipeTypeBuilder b)]) = _$ChangeSwipeType;

  static ChangeSwipeType from(SwipeType type) => ChangeSwipeType((b) => b..type = type);
}