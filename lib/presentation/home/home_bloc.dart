import 'dart:async';
import 'package:chyc_sie_roboty/presentation/home/home_event.dart';
import 'package:chyc_sie_roboty/presentation/home/home_state.dart';
import 'package:chyc_sie_roboty/util/bloc.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Bloc {
  final BehaviorSubject<HomeState> _stateSubject = BehaviorSubject.seeded(ShowLoadingCards());
  final PublishSubject<HomeEvent> _eventSubject = PublishSubject();
  StreamSubscription<HomeEvent> _eventSubscription;
  StreamSubscription<dynamic> _dataSubscription;

  Function(HomeEvent) get dispatch => _eventSubject.sink.add;

  Observable<HomeState> get state => _stateSubject.stream;

  HomeBloc() {
    _eventSubscription = _eventSubject.stream.listen((event) => _mapEventToState(_stateSubject.value, event));
  }

  _mapEventToState(HomeState lastState, HomeEvent event) {}

  @override
  dispose() {
    _eventSubscription.cancel();
    _dataSubscription?.cancel();
    _stateSubject.close();
    _eventSubject.close();
  }
}
