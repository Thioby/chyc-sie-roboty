import 'package:chyc_sie_roboty/domain/data/course.dart';
import 'package:chyc_sie_roboty/style/app_typography.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:chyc_sie_roboty/style/images.dart';
import 'package:chyc_sie_roboty/widget/app_divider.dart';
import 'package:chyc_sie_roboty/widget/shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({Key key, @required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(Dimens.L),
        decoration: BoxDecoration(
          boxShadow: buildShadow(),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(Dimens.BORDER_RADIUS)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("JCGroup", style: AppTypography.offerCompanyTextStyle),
                SizedBox(width: Dimens.S),
              ],
            ),
            Text('Kierunek - Aktywizacja', style: AppTypography.offerTitleTextStyle),
            SizedBox(height: Dimens.S),
            Text('Katowice, woj. Śląskie, Polska', style: AppTypography.offerLocationTextStyle),
            SizedBox(height: Dimens.M),
            AppDivider(),
            SizedBox(height: Dimens.M),
            Text('Dodatkowe informacje', style: AppTypography.offerSkillsTextStyle),
            Expanded(
              child: Text(
                '30 osób biernych zawodowo znajdujących się w szczególnej sytuacji na rynku pracy – wyłącznie osoby w wieku 50 lat i więcej, o niskich kwalifikacjach, zamieszkujących obszar woj. lubuskiego.',
                style: AppTypography.offerLocationTextStyle,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(Images.INFO),
                SizedBox(width: Dimens.S),
                Text('Kliknij by zobaczyć więcej informacji', style: AppTypography.offerLabelTextStyle),
              ],
            )
          ],
        ),
      );
}
