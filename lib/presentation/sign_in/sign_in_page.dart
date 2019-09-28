import 'package:chyc_sie_roboty/widget/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chyc_sie_roboty/style/image.dart';

class SignInPage extends StatefulWidget {
  @override
  State createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: _buildColumn(),
        ),
      );

  Widget _buildColumn() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 57),
          Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: new SvgPicture.asset(
              Images.LOGO_TEXT,
              height: 50,
            ),
          ),
          Expanded(
            child: SvgPicture.asset(
              Images.WELCOME_BACKGROUND,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 38.0, right: 38.0),
            child: FilledButton(
              title: "Zaloguj",
              enabled: true,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.only(left: 38.0, right: 38.0),
            child: FilledButton(
              title: "Utwórz konto",
            ),
          ),
          SizedBox(height: 57)
        ],
      );
}
