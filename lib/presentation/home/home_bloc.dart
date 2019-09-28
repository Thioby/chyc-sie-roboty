import 'dart:async';
import 'package:chyc_sie_roboty/domain/data/offer.dart';
import 'package:chyc_sie_roboty/presentation/home/home_event.dart';
import 'package:chyc_sie_roboty/presentation/home/home_state.dart';
import 'package:chyc_sie_roboty/presentation/home/swipe_type.dart';
import 'package:chyc_sie_roboty/util/bloc.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Bloc {
  final BehaviorSubject<HomeState> _stateSubject = BehaviorSubject();
  final PublishSubject<HomeEvent> _eventSubject = PublishSubject();
  StreamSubscription<HomeEvent> _eventSubscription;
  StreamSubscription<dynamic> _dataSubscription;

  SwipeType _swipeType = SwipeType.OFFER;

  Function(HomeEvent) get dispatch => _eventSubject.sink.add;

  Observable<HomeState> get state => _stateSubject.stream;

  HomeBloc() {
    _eventSubscription = _eventSubject.stream.listen((event) => _mapEventToState(_stateSubject.value, event));
    _loadData();
  }

  void _loadData() {
    if (_swipeType == SwipeType.OFFER) {
      _stateSubject.add(ShowLoadingOfferCards());
    } else {
      _stateSubject.add(ShowLoadingCourseCards());
    }

    _dataSubscription?.cancel();
    _dataSubscription = Observable.timer(null, Duration(seconds: 2)).listen((_) {
      _stateSubject.add(ShowOfferCards.from(List<Offer>.generate(10, (i) => Offer())));
    });
  }

  _mapEventToState(HomeState lastState, HomeEvent event) {
    if (event is DiscardOffer) {
    } else if (event is AcceptOffer) {
    } else if (event is ChangeDataType) {
      if (_swipeType == SwipeType.OFFER) {
        _swipeType = SwipeType.COURSE;
      } else {
        _swipeType = SwipeType.OFFER;
      }
      _loadData();
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
