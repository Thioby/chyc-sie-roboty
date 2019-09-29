import 'package:chyc_sie_roboty/app.dart';
import 'package:chyc_sie_roboty/injection/bloc_injector.dart';
import 'package:chyc_sie_roboty/injection/modules.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injector/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Injector injector = Injector.appInstance;
  await registerModules(injector);

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid = new AndroidInitializationSettings('app_icon');
  var initializationSettingsIOS = new IOSInitializationSettings(onDidReceiveLocalNotification: (_, _1, _2, _3) {});
  var initializationSettings = new InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
  flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (payload) {});

  FirebaseMessaging().configure(
    onMessage: (data) {
      print(data);
      final androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'new-course',
        'New course',
        'Push notifications for new courses!',
        importance: Importance.Max,
        priority: Priority.High,
        ticker: 'new-course',
      );
      final iOSPlatformChannelSpecifics = IOSNotificationDetails();
      final platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics,
        iOSPlatformChannelSpecifics,
      );
      flutterLocalNotificationsPlugin.show(
        0,
        data['notification']['title'],
        data['notification']['body'],
        platformChannelSpecifics,
        payload: 'item x',
      );

      return Future(() {});
    },
  );

  injector.getDependency<FirebaseMessaging>().requestNotificationPermissions();
  Fimber.plantTree(DebugTree.elapsed());
  runApp(
    BlocInjector(
      injector,
      child: App(),
    ),
  );
}
