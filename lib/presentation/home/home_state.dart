import 'package:built_value/built_value.dart';

part 'home_state.g.dart';

abstract class HomeState {}

abstract class ShowLoadingCards implements Built<ShowLoadingCards, ShowLoadingCardsBuilder>, HomeState {
  ShowLoadingCards._();

  factory ShowLoadingCards([updates(ShowLoadingCardsBuilder b)]) = _$ShowLoadingCards;
}

abstract class ShowCards implements Built<ShowCards, ShowCardsBuilder>, HomeState {
  ShowCards._();

  factory ShowCards([updates(ShowCardsBuilder b)]) = _$ShowCards;
}
