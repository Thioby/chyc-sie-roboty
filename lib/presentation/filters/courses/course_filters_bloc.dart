import 'dart:async';
import 'package:chyc_sie_roboty/domain/auth/user_repository.dart';
import 'package:chyc_sie_roboty/presentation/filters/courses/course_filters_event.dart';
import 'package:chyc_sie_roboty/presentation/filters/courses/course_filters_state.dart';
import 'package:chyc_sie_roboty/util/bloc.dart';
import 'package:rxdart/rxdart.dart';

class CourseFiltersBloc extends Bloc {
  final UserRepository _userRepository;

  final BehaviorSubject<CourseFiltersState> _stateSubject = BehaviorSubject.seeded(ShowData());
  final PublishSubject<CourseFiltersEvent> _eventSubject = PublishSubject();
  final PublishSubject<bool> _routeSubject = PublishSubject();
  StreamSubscription<CourseFiltersEvent> _eventSubscription;
  StreamSubscription<dynamic> _dataSubscription;

  Function(CourseFiltersEvent) get dispatch => _eventSubject.sink.add;

  Observable<CourseFiltersState> get state => _stateSubject.stream;

  Observable<bool> get route => _routeSubject.stream;

  CourseFiltersBloc(this._userRepository) {
    _eventSubscription = _eventSubject.stream.listen((event) => _mapEventToState(_stateSubject.value, event));
  }

  _mapEventToState(CourseFiltersState lastState, CourseFiltersEvent event) {
    if (event is UpdateFilters) {
      _stateSubject.add(ShowLoading());
      _dataSubscription?.cancel();
      _dataSubscription = _userRepository.filterCourses(event.category, event.localization).listen((_) {
        _routeSubject.add(true);
      });
    }
  }

  @override
  dispose() {
    _eventSubscription.cancel();
    _dataSubscription?.cancel();
    _routeSubject.close();
    _stateSubject.close();
    _eventSubject.close();
  }
}
