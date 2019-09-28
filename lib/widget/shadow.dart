import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:flutter/material.dart';

List<BoxShadow> buildShadow() => [
      const BoxShadow(
        offset: Offset(0, 2),
        color: AppColors.shadowGrey,
        spreadRadius: -5,
        blurRadius: 10,
      )
    ];
