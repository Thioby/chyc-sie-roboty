import 'package:chyc_sie_roboty/app.dart';
import 'package:chyc_sie_roboty/injection/bloc_injector.dart';
import 'package:chyc_sie_roboty/injection/modules.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Injector injector = Injector.appInstance;
  await registerModules(injector);

  injector.getDependency<FirebaseMessaging>().requestNotificationPermissions();
  Fimber.plantTree(DebugTree.elapsed());
  runApp(
    BlocInjector(
      injector,
      child: App(),
    ),
  );
}
