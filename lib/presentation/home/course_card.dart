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
                Text(course.createdBy ?? "", style: AppTypography.offerCompanyTextStyle),
                SizedBox(width: Dimens.S),
              ],
            ),
            Text(course.name ?? "", style: AppTypography.offerTitleTextStyle),
            SizedBox(height: Dimens.S),
            Text(course.courseLocalization ?? "", style: AppTypography.offerLocationTextStyle),
            SizedBox(height: Dimens.M),
            AppDivider(),
            SizedBox(height: Dimens.M),
            Text('Dodatkowe informacje', style: AppTypography.offerSkillsTextStyle),
            SizedBox(height: Dimens.S),
            Expanded(
              child: Text(
                course.description ?? "",
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
