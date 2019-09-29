import 'package:chyc_sie_roboty/domain/data/offer.dart';
import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/app_typography.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:chyc_sie_roboty/style/images.dart';
import 'package:chyc_sie_roboty/widget/app_divider.dart';
import 'package:chyc_sie_roboty/widget/shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OfferCard extends StatelessWidget {
  final Offer offer;
  final void Function(Offer offer) onPress;

  const OfferCard({Key key, @required this.offer, @required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          this.onPress(this.offer);
        },
        child: Container(
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(Images.INFO),
                  SizedBox(width: Dimens.S),
                  Text('Kliknij by zobaczyć więcej informacji', style: AppTypography.offerLabelTextStyle),
                ],
              ),
            ],
          ),
        ),
      );
}
