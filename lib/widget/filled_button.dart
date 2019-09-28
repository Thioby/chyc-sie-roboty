import 'package:chyc_sie_roboty/app.dart';
import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {

  final String title;
  final bool enabled;

  FilledButton({Key key, this.title, this.enabled = false}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: Dimens.BUTTON_HEIGHT,
        child: Container(
          height: Dimens.BUTTON_HEIGHT,
          color: enabled ? AppColors.azure : AppColors.azure,
          child: Text(
            title,
            textAlign: TextAlign.center,

        ),
        )
      );
}
