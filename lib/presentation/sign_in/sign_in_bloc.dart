import 'dart:async';

import 'package:chyc_sie_roboty/domain/use_case/sign_in_use_case.dart';
import 'package:chyc_sie_roboty/presentation/sign_in/sign_in_state.dart';
import 'package:chyc_sie_roboty/util/bloc.dart';
import 'package:rxdart/rxdart.dart';

class SignInBloc extends Bloc {
  SignInUseCase _signInUseCase;

  final PublishSubject<SignInEvent> _eventSubject = PublishSubject();
  final PublishSubject<String> _routeSubject = PublishSubject();
  final BehaviorSubject<SignInState> _streamSubject = BehaviorSubject.seeded(SignInState.Idle);

  StreamSubscription _eventSubscription;

  Function(SignInEvent) get dispatch => _eventSubject.sink.add;
  Observable<SignInState> get stream => _streamSubject.stream;
  Observable<String> get route => _routeSubject.stream;

  SignInBloc(this._signInUseCase) {
    _eventSubscription = _eventSubject.stream.listen((_) => _signIn());
  }

  _signIn() {
    _streamSubject.add(SignInState.Loading);
    _signInUseCase
        .invoke()
        .listen((_) => _success())
        .onError((_) => _streamSubject.addError(SignInState.Error));
  }

  void _success() {
    _streamSubject.add(SignInState.Success);
    _routeSubject.add("Home");
  }

  @override
  void dispose() {
    _eventSubscription.cancel();
    _streamSubject.close();
    _eventSubject.close();
  }
}
