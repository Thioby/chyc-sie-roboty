import 'package:chyc_sie_roboty/presentation/home/home_page.dart';
import 'package:chyc_sie_roboty/presentation/home/swipe_type.dart';
import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  SwipeType _swipeType = SwipeType.OFFER;

  @override
  Widget build(BuildContext context) => Scaffold(
      body: HomePage(
        swipeTypeCallback: (type) {
//          setState(() {
//            _swipeType = type;
//          });
        },
      ),
      floatingActionButton: _buildFloatingActionButton(),
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

  Widget _buildFloatingActionButton() {
    return _swipeType == SwipeType.OFFER
        ? FloatingActionButton(
            backgroundColor: AppColors.golden,
            child: Text('Kursy'),
            onPressed: () {},
          )
        : _swipeType == SwipeType.COURSE
            ? FloatingActionButton(
                backgroundColor: AppColors.azure,
                child: Text('Praca'),
                onPressed: () {},
              )
            : null;
  }
}
