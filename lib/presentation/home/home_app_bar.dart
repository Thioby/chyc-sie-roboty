import 'dart:ui';

import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/app_typography.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:chyc_sie_roboty/style/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  final String userName;
  final Function onFilterClick;

  const HomeAppBar({Key key, @required this.userName, this.onFilterClick}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: Dimens.XXXL),
            child: Container(
              padding: const EdgeInsets.only(top: 30, bottom: 47, left: Dimens.L, right: Dimens.L),
              color: AppColors.azure,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Witaj $userName!', style: AppTypography.appBarTitleTextStyle),
                        Text('Wybrane dla Ciebie na dziś:', style: AppTypography.appBarSubtitleTextStyle),
                      ],
                    ),
                  ),
                  Image.asset(
                    Images.AVATAR,
                    width: 34,
                    height: 34,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: InkWell(
              onTap: () => onFilterClick(),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: Dimens.M),
                    Expanded(child: Text('Filtruj ogłoszenia')),
                    SvgPicture.asset(Images.FILTER),
                    SizedBox(width: Dimens.M),
                  ],
                ),
              ),
            ),
          )
        ],
      );
}
