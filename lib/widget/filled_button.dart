import 'dart:ffi';

import 'package:chyc_sie_roboty/app.dart';
import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  FilledButton({Key key, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      height: Dimens.BUTTON_HEIGHT,
      child: MaterialButton(
        onPressed: onPressed,
        height: Dimens.BUTTON_HEIGHT,
        color: AppColors.azure,
        textColor: Colors.white,
        child: Text(
          title
        ),
      ));
}
