import 'package:chyc_sie_roboty/domain/auth/user_repository.dart';
import 'package:chyc_sie_roboty/presentation/sign_in/google_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

class SignInUseCase {
  final UserRepository _userRepository;

  SignInUseCase(this._userRepository);

  Observable invoke() => Observable.fromFuture(loginGoogle()).flatMap((user) => _userRepository.login(user));
}
