import 'package:chyc_sie_roboty/presentation/main/main_page.dart';
import 'package:chyc_sie_roboty/presentation/sign_in/sign_in_bloc.dart';
import 'package:chyc_sie_roboty/presentation/sign_in/sign_in_state.dart';
import 'package:chyc_sie_roboty/util/bloc_state.dart';
import 'package:chyc_sie_roboty/widget/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chyc_sie_roboty/style/image.dart';

class SignInPage extends StatefulWidget {
  @override
  State createState() => _SignInState();
}

class _SignInState extends BlocState<SignInPage, SignInBloc> {

  @override
  void afterBlocInit() {
    bloc.route.listen((name) => _navigate(name));
    super.afterBlocInit();
  }
  void _signIn() {
    bloc.dispatch(SignInEvent.SignIn);
  }

  void _navigate(String name) {
    if (name == "Home") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => MainPage()),
            (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: StreamBuilder(
            stream: bloc.stream,
            builder: (context, snapshot) {
              return _mapStateToView(snapshot.data);
            },
          ),
        ),
      );

  Widget _buildColumn(Widget bottomWidget) => Column(
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
            child: bottomWidget,
          ),
          SizedBox(height: 57)
        ],
      );

  Widget _mapStateToView(SignInState state) {
    switch (state) {
      case SignInState.Loading:
        return _buildColumn(Center(
          child: CircularProgressIndicator(),
        ));
      case SignInState.Success:
        return _buildColumn(FilledButton(
          title: "Wejdź do aplikacji",
          onPressed: _signIn,
        ));
      case SignInState.Error:
        return _buildColumn(FilledButton(
          title: "Wejdź do aplikacji",
          onPressed: _signIn,
        ));
      case SignInState.Idle:
        return _buildColumn(FilledButton(
          title: "Wejdź do aplikacji",
          onPressed: _signIn,
        ));
    }
    ;
    return Container();
  }
}
