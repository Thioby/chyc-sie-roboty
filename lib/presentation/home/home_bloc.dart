import 'dart:async';
import 'package:chyc_sie_roboty/domain/auth/user.dart';
import 'package:chyc_sie_roboty/domain/auth/user_repository.dart';
import 'package:chyc_sie_roboty/domain/data/course.dart';
import 'package:chyc_sie_roboty/domain/data/data_repository.dart';
import 'package:chyc_sie_roboty/domain/data/offer.dart';
import 'package:chyc_sie_roboty/presentation/home/home_event.dart';
import 'package:chyc_sie_roboty/presentation/home/home_state.dart';
import 'package:chyc_sie_roboty/presentation/home/swipe_type.dart';
import 'package:chyc_sie_roboty/util/bloc.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Bloc {
  final DataRepository _dataRepository;
  final UserRepository _userRepository;

  final BehaviorSubject<HomeState> _stateSubject = BehaviorSubject();
  final PublishSubject<HomeEvent> _eventSubject = PublishSubject();
  StreamSubscription<HomeEvent> _eventSubscription;
  StreamSubscription<User> _userStateSubscription;
  StreamSubscription<dynamic> _dataSubscription;

  SwipeType _swipeType = SwipeType.OFFER;
  List<Offer> _currentOffers = [];
  List<Offer> _swipedOffers = [];
  List<Course> _currentCourses = [];
  List<Course> _swipedCourses = [];
  String _userName = "";

  Function(HomeEvent) get dispatch => _eventSubject.sink.add;

  Observable<HomeState> get state => _stateSubject.stream;

  HomeBloc(this._dataRepository, this._userRepository) {
    _eventSubscription = _eventSubject.stream.listen((event) => _mapEventToState(_stateSubject.value, event));
    _userStateSubscription = _userRepository.userState().listen((user) {
      _userName = user.name;
    });
    _loadData();
  }

  void _loadData() {
    if (_swipeType == SwipeType.OFFER) {
      _stateSubject.add(ShowLoadingOfferCards.from(_userName));
    } else {
      _stateSubject.add(ShowLoadingCourseCards.from(_userName));
    }

    _dataSubscription?.cancel();

    if (_swipeType == SwipeType.OFFER) {
      _dataSubscription = _dataRepository.offers().listen((offers) {
        _currentOffers = _filterOffers(offers);
        _stateSubject.add(ShowOfferCards.from(_currentOffers, _userName));
      });
    } else if (_swipeType == SwipeType.COURSE) {
      _dataSubscription = _dataRepository.courses().listen((courses) {
        _currentCourses = _filterCourses(courses);
        _stateSubject.add(ShowCourseCards.from(_currentCourses, _userName));
      });
    }
  }

  _mapEventToState(HomeState lastState, HomeEvent event) {
    if (event is Discard) {
      if (_swipeType == SwipeType.OFFER) {
        _filterOutOffer();
      } else {
        _filterOutCourse();
      }
    } else if (event is Accept) {
      if (_swipeType == SwipeType.OFFER) {
        _filterOutOffer();
      } else {
        _filterOutCourse();
      }
    } else if (event is ChangeDataType) {
      if (_swipeType == SwipeType.OFFER) {
        _swipeType = SwipeType.COURSE;
      } else {
        _swipeType = SwipeType.OFFER;
      }
      _loadData();
    } else if (event is Reload) {
      _loadData();
    }
  }

  Offer _filterOutOffer() {
    final offer = _currentOffers.removeAt(0);
    _swipedOffers.add(offer);
    _stateSubject.add(ShowOfferCards.from(_currentOffers, _userName));
    return offer;
  }

  Course _filterOutCourse() {
    final course = _currentCourses.removeAt(0);
    _swipedCourses.add(course);
    _stateSubject.add(ShowCourseCards.from(_currentCourses, _userName));
    return course;
  }

  Iterable<Offer> _filterOffers(List<Offer> offers) => offers
      .where(
          (offer) => _swipedOffers.firstWhere((swipedOffer) => swipedOffer.id == offer.id, orElse: () => null) == null)
      .toList();

  Iterable<Course> _filterCourses(List<Course> courses) => courses
      .where((course) =>
          _swipedCourses.firstWhere((swipedCourse) => swipedCourse.id == course.id, orElse: () => null) == null)
      .toList();

  @override
  dispose() {
    _eventSubscription.cancel();
    _dataSubscription?.cancel();
    _stateSubject.close();
    _eventSubject.close();
  }
}
