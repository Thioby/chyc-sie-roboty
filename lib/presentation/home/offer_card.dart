import 'package:chyc_sie_roboty/domain/data/offer.dart';
import 'package:chyc_sie_roboty/style/app_typography.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:chyc_sie_roboty/style/images.dart';
import 'package:chyc_sie_roboty/widget/app_divider.dart';
import 'package:chyc_sie_roboty/widget/shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OfferCard extends StatelessWidget {
  final Offer offer;

  const OfferCard({Key key, @required this.offer}) : super(key: key);

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
                Text("PolBud", style: AppTypography.offerCompanyTextStyle),
                SizedBox(width: Dimens.S),
              ],
            ),
            Text('Spawacz/Ślusarz', style: AppTypography.offerTitleTextStyle),
            SizedBox(height: Dimens.S),
            Text('Katowice, woj. Śląskie, Polska', style: AppTypography.offerLocationTextStyle),
            SizedBox(height: Dimens.M),
            AppDivider(),
            SizedBox(height: Dimens.M),
            Text('Wymagane umiejętności:', style: AppTypography.offerSkillsTextStyle),
            Expanded(
              child: Container(),
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
