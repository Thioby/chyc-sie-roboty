import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/app_typography.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:flutter/material.dart';

class LabeledDropdown extends StatefulWidget {
  final String label;
  final String selected;
  final ValueChanged<String> onChanged;
  final List<DropdownMenuItem<String>> items;

  const LabeledDropdown({
    Key key,
    this.label,
    this.selected,
    this.onChanged,
    this.items,
  }) : super(key: key);

  @override
  _LabeledDropdownState createState() => _LabeledDropdownState();
}

class _LabeledDropdownState extends State<LabeledDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          widget.label,
          style: AppTypography.formLabel,
        ),
        SizedBox(height: Dimens.M),
        Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: Dimens.S, bottom: Dimens.S),
            child: DropdownButton(
              value: widget.selected,
              onChanged: widget.onChanged,
              items: widget.items,
              underline: Container(),
            ),
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
