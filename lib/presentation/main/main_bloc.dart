import 'dart:async';
import 'package:chyc_sie_roboty/presentation/home/swipe_type.dart';
import 'package:chyc_sie_roboty/presentation/main/main_event.dart';
import 'package:chyc_sie_roboty/presentation/main/main_state.dart';
import 'package:chyc_sie_roboty/util/bloc.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc extends Bloc {
  final BehaviorSubject<MainState> _stateSubject = BehaviorSubject();
  final PublishSubject<MainEvent> _eventSubject = PublishSubject();
  StreamSubscription<MainEvent> _eventSubscription;
  StreamSubscription<dynamic> _dataSubscription;

  Function(MainEvent) get dispatch => _eventSubject.sink.add;

  Observable<MainState> get state => _stateSubject.stream;

  MainBloc() {
    _eventSubscription = _eventSubject.stream.listen((event) => _mapEventToState(_stateSubject.value, event));
  }

  _mapEventToState(MainState lastState, MainEvent event) {
    if (event is ChangeSwipeType) {
      if (event.type == SwipeType.OFFER) {
        _stateSubject.add(ShowCoursesButton());
      } else {
        _stateSubject.add(ShowOffersButton());
      }
    }
  }

  @override
  dispose() {
    _eventSubscription.cancel();
    _dataSubscription?.cancel();
    _stateSubject.close();
    _eventSubject.close();
  }
}
