import 'package:chyc_sie_roboty/presentation/sign_in/sign_in_page.dart';
import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'ChycSieRoboty',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: AppColors.backgroundColor,
        ),
        home: SignInPage(),
      );
}
