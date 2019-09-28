import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/app_typography.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:chyc_sie_roboty/style/strings.dart';
import 'package:chyc_sie_roboty/widget/labeled_input.dart';
import 'package:flutter/material.dart';

class CoursesFiltersPage extends StatefulWidget {
  @override
  _CoursesFiltersPageState createState() => _CoursesFiltersPageState();
}

class _CoursesFiltersPageState extends State<CoursesFiltersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildTop(context),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(Dimens.L),
              child: Column(
                children: <Widget>[
                  LabeledInput(
                    label: Strings.localization(context),
                    hint: Strings.filterInput(context),
                  ),
                  SizedBox(height: Dimens.M),
                  LabeledInput(
                    label: Strings.localization(context),
                    hint: Strings.filterInput(context),
                  ),
                  SizedBox(height: Dimens.M),
                  LabeledInput(
                    label: Strings.localization(context),
                    hint: Strings.filterInput(context),
                  ),
                  SizedBox(height: Dimens.M),
                  LabeledInput(
                    label: Strings.localization(context),
                    hint: Strings.filterInput(context),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildTop(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.L),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.filterCourses(context),
              style: AppTypography.screenTitle,
            ),
            Text(
              Strings.filtersSubtitle(context),
              style: AppTypography.screenSubTitle,
            )
          ],
        ),
      ),
    );
  }
}
