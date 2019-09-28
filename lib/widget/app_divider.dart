import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: AppColors.twilight10,
        height: Dimens.DIVIDER_HEIGHT,
      );
}
