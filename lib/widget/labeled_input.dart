import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/app_typography.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:flutter/material.dart';

class LabeledInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final ValueChanged<String> onTextChange;

  const LabeledInput({Key key, this.label, this.controller, this.hint, this.onTextChange,}) : super(key: key);

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
          onChanged: onTextChange,
          decoration: InputDecoration(
              focusedBorder: border(),
              border: border(),
              enabledBorder: border(),
              disabledBorder: border(),
              hintText: hint,
              filled: true,
              fillColor: AppColors.backgroundColor
          ),
        )
      ],
    );
  }

  InputBorder border() =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(
          width: 0,
          color: Colors.transparent,
          style: BorderStyle.none,
        ),
      );
}
