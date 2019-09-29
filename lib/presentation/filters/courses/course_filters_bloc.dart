import 'dart:async';
import 'package:chyc_sie_roboty/presentation/filters/courses/course_filters_event.dart';
import 'package:chyc_sie_roboty/presentation/filters/courses/course_filters_state.dart';
import 'package:chyc_sie_roboty/util/bloc.dart';
import 'package:rxdart/rxdart.dart';

class CourseFiltersBloc extends Bloc {
  final BehaviorSubject<CourseFiltersState> _stateSubject = BehaviorSubject();
  final PublishSubject<CourseFiltersEvent> _eventSubject = PublishSubject();
  StreamSubscription<CourseFiltersEvent> _eventSubscription;
  StreamSubscription<dynamic> _dataSubscription;

  Function(CourseFiltersEvent) get dispatch => _eventSubject.sink.add;

  Observable<CourseFiltersState> get state => _stateSubject.stream;

  CourseFiltersBloc() {
    _eventSubscription = _eventSubject.stream.listen((event) => _mapEventToState(_stateSubject.value, event));
  }

  _mapEventToState(CourseFiltersState lastState, CourseFiltersEvent event) {}

  @override
  dispose() {
    _eventSubscription.cancel();
    _dataSubscription?.cancel();
    _stateSubject.close();
    _eventSubject.close();
  }
}
