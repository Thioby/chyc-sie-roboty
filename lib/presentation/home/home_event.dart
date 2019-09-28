import 'package:built_value/built_value.dart';

part 'home_event.g.dart';

abstract class HomeEvent {}

abstract class DiscardOffer implements Built<DiscardOffer, DiscardOfferBuilder>, HomeEvent {
  DiscardOffer._();

  factory DiscardOffer([updates(DiscardOfferBuilder b)]) = _$DiscardOffer;
}