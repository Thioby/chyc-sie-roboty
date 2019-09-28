import 'package:chyc_sie_roboty/injection/bloc_module.dart';
import 'package:chyc_sie_roboty/injection/data_module.dart';
import 'package:injector/injector.dart';

registerModules(Injector injector) async {
  await registerDataModules(injector);
  registerBlocModules(injector);
}
