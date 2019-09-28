import 'package:injector/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

registerDataModules(Injector injector) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  injector..registerSingleton((_) => prefs);
}
