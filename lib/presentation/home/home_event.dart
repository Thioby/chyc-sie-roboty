import 'package:built_value/built_value.dart';

part 'home_event.g.dart';

abstract class HomeEvent {}

abstract class Discard implements Built<Discard, DiscardBuilder>, HomeEvent {
  Discard._();

  int get index;

  factory Discard([updates(DiscardBuilder b)]) = _$Discard;

  static Discard from(int index) => Discard((b) => b..index = index);
}

abstract class Accept implements Built<Accept, AcceptBuilder>, HomeEvent {
  Accept._();

  int get index;

  factory Accept([updates(AcceptBuilder b)]) = _$Accept;

  static Discard from(int index) => Discard((b) => b..index = index);
}

abstract class ChangeDataType implements Built<ChangeDataType, ChangeDataTypeBuilder>, HomeEvent {
  ChangeDataType._();

  factory ChangeDataType([updates(ChangeDataTypeBuilder b)]) = _$ChangeDataType;
}

abstract class Reload implements Built<Reload, ReloadBuilder>, HomeEvent {
  Reload._();

  factory Reload([updates(ReloadBuilder b)]) = _$Reload;
}