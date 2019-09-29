import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:chyc_sie_roboty/style/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TwoTypeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(Dimens.BORDER_RADIUS)),
      child: Container(
        height: 72,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.red,
                child: Center(
                  child: SvgPicture.asset(Images.CANCEL),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: MaterialButton(
                  onPressed: () {},
                  color: AppColors.azure,
                  child: Center(child: Container(child: SvgPicture.asset(Images.HEART))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
