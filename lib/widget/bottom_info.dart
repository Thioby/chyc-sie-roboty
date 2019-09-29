import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:chyc_sie_roboty/style/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'filled_button.dart';

class BottomInfo extends StatefulWidget {
  @override
  _BottomInfoState createState() => _BottomInfoState();
}

class _BottomInfoState extends State<BottomInfo> {
  void _back() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        color: Color(0xFF737373),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.only(topLeft: const Radius.circular(33.0), topRight: const Radius.circular(33.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 67),
              Container(
                  height: 135,
                  width: 125,
                  child: SvgPicture.asset(
                    Images.BOTTOM_INFO_ICON,
                  )),
              SizedBox(height: 54),
              Text(
                'Fantastycznie',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, color: AppColors.twilight),
              ),
              SizedBox(height: 13),
              Padding(
                padding: EdgeInsets.only(left: 33.0, right: 33.0),
                child: Text(
                  'Super że, wyraziłeś zainteresowanie.  Przetwarzamy twoją wiadomość i postaramy się skontaktować z Tobą w ciągu 2 dni!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: AppColors.twilight),
                ),
              ),
              SizedBox(height: 34),
              Padding(
                padding: EdgeInsets.only(left: 38.0, right: 38.0),
                child: FilledButton(
                  title: "Wróć do przęglądania",
                  onPressed: _back,
                ),
              )
            ],
          ),
        ));
  }
}
