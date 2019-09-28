import 'package:chyc_sie_roboty/presentation/home/home_page.dart';
import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: HomePage(),
      floatingActionButton: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.golden),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: SvgPicture.asset(Images.INFO), title: Text('XD')),
          BottomNavigationBarItem(icon: SvgPicture.asset(Images.INFO), title: Text('XD')),
          BottomNavigationBarItem(icon: SvgPicture.asset(Images.INFO), title: Text('XD')),
          BottomNavigationBarItem(icon: SvgPicture.asset(Images.INFO), title: Text('XD')),
        ],
      ));
}
