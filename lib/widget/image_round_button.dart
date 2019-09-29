import 'package:chyc_sie_roboty/style/app_typography.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:flutter/material.dart';

class RoundImageButton extends StatelessWidget {
  final Widget image;
  final Function onTap;
  final String text;

  const RoundImageButton({Key key, this.image, this.onTap, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              child: image,
              onTap: onTap,
            ),
          ),
          SizedBox(height: Dimens.S),
          Text(text, style: AppTypography.buttonTextStyle),
        ],
      );
}
