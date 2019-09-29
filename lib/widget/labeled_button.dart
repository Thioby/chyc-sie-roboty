import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/app_typography.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:flutter/material.dart';

class LabeledButton extends StatelessWidget {
  final String label;
  final String selected;
  final VoidCallback onTap;

  const LabeledButton({
    Key key,
    this.label,
    this.selected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          label,
          style: AppTypography.formLabel,
        ),
        SizedBox(height: Dimens.M),
        MaterialButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.all(
              Radius.circular(Dimens.CORNER),
            ),
          ),
          color: AppColors.backgroundColor,
          onPressed: onTap,
          padding: EdgeInsets.symmetric(vertical: Dimens.M),
          child: Padding(
            padding: const EdgeInsets.only(left: Dimens.M, top: 8, bottom: 8),
            child: Row(
              children: <Widget>[
                Text(selected),
              ],
            ),
          ),
          elevation: 0,
        )
      ],
    );
  }
}
