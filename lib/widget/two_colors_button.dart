import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/app_typography.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TwoColorsButton extends StatelessWidget {
  final VoidCallback leftClick;
  final VoidCallback rightClick;
  final String leftText;
  final String rightText;

  const TwoColorsButton({
    Key key,
    this.leftClick,
    this.rightClick,
    this.leftText,
    this.rightText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            child: Text(
              leftText,
              style: AppTypography.buttonLight,
            ),
            padding: EdgeInsets.symmetric(vertical: 16),
            onPressed: leftClick,
            color: AppColors.golden,
            splashColor: AppColors.azure,
            shape: RoundedRectangleBorder(
              side: BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimens.BORDER_RADIUS),
                bottomLeft: Radius.circular(Dimens.BORDER_RADIUS),
              ),
            ),
          ),
        ),
        Expanded(
          child: MaterialButton(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              rightText,
              style: AppTypography.buttonLight,
            ),
            onPressed: rightClick,
            color: AppColors.azure,
            splashColor: AppColors.golden,
            shape: RoundedRectangleBorder(
              side: BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(Dimens.BORDER_RADIUS),
                topRight: Radius.circular(Dimens.BORDER_RADIUS),
              ),
            ),
          ),
        )
      ],
    );
  }
}
