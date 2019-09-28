import 'package:chyc_sie_roboty/presentation/home/home_bloc.dart';
import 'package:chyc_sie_roboty/presentation/sign_in/sign_in_bloc.dart';
import 'package:injector/injector.dart';

registerBlocModules(Injector injector) {
  injector..registerDependency((injector) => HomeBloc())
  ..registerDependency((injector) => SignInBloc(injector.getDependency()));
}
