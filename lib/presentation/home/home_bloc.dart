import 'dart:async';
import 'package:chyc_sie_roboty/domain/data/data_repository.dart';
import 'package:chyc_sie_roboty/domain/data/offer.dart';
import 'package:chyc_sie_roboty/presentation/home/home_event.dart';
import 'package:chyc_sie_roboty/presentation/home/home_state.dart';
import 'package:chyc_sie_roboty/presentation/home/swipe_type.dart';
import 'package:chyc_sie_roboty/util/bloc.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Bloc {
  final DataRepository _dataRepository;

  final BehaviorSubject<HomeState> _stateSubject = BehaviorSubject();
  final PublishSubject<HomeEvent> _eventSubject = PublishSubject();
  StreamSubscription<HomeEvent> _eventSubscription;
  StreamSubscription<dynamic> _dataSubscription;

  SwipeType _swipeType = SwipeType.OFFER;
  List<Offer> _currentOffers = [];
  List<Offer> _swipedOffers = [];

  Function(HomeEvent) get dispatch => _eventSubject.sink.add;

  Observable<HomeState> get state => _stateSubject.stream;

  HomeBloc(this._dataRepository) {
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

    if (_swipeType == SwipeType.OFFER) {
      _dataSubscription = _dataRepository.offers().listen((offers) {
        _currentOffers = _filterOffers(offers);
        _stateSubject.add(ShowOfferCards.from(_currentOffers));
      });
    }
  }

  _mapEventToState(HomeState lastState, HomeEvent event) {
    if (event is Discard) {
      _filterOutOffer();
    } else if (event is Accept) {
      _filterOutOffer();
    } else if (event is ChangeDataType) {
      if (_swipeType == SwipeType.OFFER) {
        _swipeType = SwipeType.COURSE;
      } else {
        _swipeType = SwipeType.OFFER;
      }
      _loadData();
    }
  }

  Offer _filterOutOffer() {
    final offer = _currentOffers.removeAt(0);
    _swipedOffers.add(offer);
    _stateSubject.add(ShowOfferCards.from(_currentOffers));
    return offer;
  }

  Iterable<Offer> _filterOffers(List<Offer> offers) => offers
      .where(
          (offer) => _swipedOffers.firstWhere((swipedOffer) => swipedOffer.id == offer.id, orElse: () => null) == null)
      .toList();

  @override
  dispose() {
    _eventSubscription.cancel();
    _dataSubscription?.cancel();
    _stateSubject.close();
    _eventSubject.close();
  }
}
