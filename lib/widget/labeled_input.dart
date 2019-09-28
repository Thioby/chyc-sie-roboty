import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/app_typography.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:flutter/material.dart';

class LabeledInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const LabeledInput({Key key, this.label, this.controller, this.hint}) : super(key: key);

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
        TextField(
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: border(),
            border: border(),
            hintText: hint,
            filled: true,
            fillColor: AppColors.background
          ),
        )
      ],
    );
  }

  InputBorder border() => OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(
          width: 0,
          color: Colors.transparent,
          style: BorderStyle.none,
        ),
      );
}
