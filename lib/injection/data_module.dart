import 'package:chyc_sie_roboty/domain/auth/user_repository.dart';
import 'package:chyc_sie_roboty/infrastructure/auth/firebase_auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injector/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

registerDataModules(Injector injector) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  injector
    ..registerSingleton((_) => prefs)
    ..registerSingleton((_) => Firestore.instance)
    ..registerSingleton<UserRepository>((injector) => FirebaseUserRepository(injector.getDependency()));
}
