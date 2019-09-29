import 'package:chyc_sie_roboty/domain/data/offer.dart';
import 'package:chyc_sie_roboty/presentation/details/detail_result.dart';
import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/app_typography.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:chyc_sie_roboty/style/images.dart';
import 'package:chyc_sie_roboty/widget/app_divider.dart';
import 'package:chyc_sie_roboty/widget/two_colors_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WorkDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Offer offer = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(Dimens.L),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(offer.companyName ?? "", style: AppTypography.offerCompanyTextStyle),
                    SizedBox(width: Dimens.S),
                    SvgPicture.asset(Images.STARS),
                  ],
                ),
                Text(offer.offerName ?? "", style: AppTypography.offerTitleTextStyle),
                SizedBox(height: Dimens.S),
                Text(offer.place ?? "", style: AppTypography.offerLocationTextStyle),
                SizedBox(height: Dimens.M),
                AppDivider(),
                SizedBox(height: Dimens.M),
                Text('Wymagane umiejętności:', style: AppTypography.offerSkillsTextStyle),
                SizedBox(height: Dimens.S),
                Expanded(
                  child: offer.requiredSkills != null
                      ? GridView.extent(
                          childAspectRatio: 4,
                          crossAxisSpacing: Dimens.S,
                          mainAxisSpacing: Dimens.S,
                          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                          children: <Widget>[
                            // ignore: sdk_version_ui_as_code
                            ...offer.requiredSkills.map(
                              (skill) => Container(
                                color: AppColors.azure.withOpacity(0.1),
                                padding: const EdgeInsets.symmetric(horizontal: Dimens.M, vertical: Dimens.S),
                                child: Center(child: Text(skill, style: AppTypography.offerSkillTextStyle)),
                              ),
                            )
                          ],
                        )
                      : Container(),
                ),
                Text('Oferujemy:', style: AppTypography.offerSkillsTextStyle),
                SizedBox(height: Dimens.S),
                Expanded(
                  child: offer.benefits != null
                      ? GridView.extent(
                          childAspectRatio: 4,
                          crossAxisSpacing: Dimens.S,
                          mainAxisSpacing: Dimens.S,
                          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                          children: <Widget>[
                            // ignore: sdk_version_ui_as_code
                            ...offer.benefits.map(
                              (skill) => Container(
                                color: AppColors.twilight76.withOpacity(0.1),
                                padding: const EdgeInsets.symmetric(horizontal: Dimens.M, vertical: Dimens.S),
                                child: Center(child: Text(skill, style: AppTypography.offerSkillTextStyle)),
                              ),
                            )
                          ],
                        )
                      : Container(),
                ),
                TwoColorsButton(
                  leftChild: SvgPicture.asset(Images.CANCEL),
                  rightChild: SvgPicture.asset(Images.HEART),
                  leftClick: () {
                    Navigator.of(context).pop(DetailResult.delete);
                  },
                  rightClick: () {
                    Navigator.of(context).pop(DetailResult.apply);
                  },
                  leftColor: AppColors.cancelColor,
                  leftSplashColor: null,
                  rightSplashColor: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
