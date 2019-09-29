import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TwoColorsButton extends StatelessWidget {
  final VoidCallback leftClick;
  final VoidCallback rightClick;
  final Widget leftChild;
  final Widget rightChild;
  final Color leftColor;
  final Color rightColor;
  final Color leftSplashColor;
  final Color rightSplashColor;

  const TwoColorsButton({
    Key key,
    this.leftClick,
    this.rightClick,
    this.leftChild,
    this.rightChild,
    this.leftColor = AppColors.golden,
    this.rightColor = AppColors.azure,
    this.leftSplashColor = AppColors.azure,
    this.rightSplashColor = AppColors.golden,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            child: leftChild,
            padding: EdgeInsets.symmetric(vertical: 16),
            onPressed: leftClick,
            color: leftColor,
            splashColor: leftSplashColor,
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
            child: rightChild,
            onPressed: rightClick,
            color: rightColor,
            splashColor: rightSplashColor,
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
