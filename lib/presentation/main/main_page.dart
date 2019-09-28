import 'package:chyc_sie_roboty/presentation/home/home_page.dart';
import 'package:chyc_sie_roboty/presentation/main/main_bloc.dart';
import 'package:chyc_sie_roboty/presentation/main/main_event.dart';
import 'package:chyc_sie_roboty/presentation/main/main_state.dart';
import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/images.dart';
import 'package:chyc_sie_roboty/util/bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rxdart/rxdart.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends BlocState<MainPage, MainBloc> {
  PublishSubject notifierSubject = PublishSubject();

  @override
  void dispose() {
    notifierSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: HomePage(
          swipeTypeCallback: (type) {
            bloc.dispatch(ChangeSwipeType.from(type));
          },
          buttonNotifier: notifierSubject,
        ),
        floatingActionButton: StreamBuilder(
          stream: bloc.state,
          builder: _builder,
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
        ),
      );

  Widget _builder(BuildContext context, AsyncSnapshot<MainState> snapshot) {
    final state = snapshot.data;

    if (state is ShowCoursesButton) {
      return FloatingActionButton(
        backgroundColor: AppColors.golden,
        child: Text('Kursy'),
        onPressed: () => notifierSubject.add(Object()),
      );
    } else if (state is ShowOffersButton) {
      return FloatingActionButton(
        backgroundColor: AppColors.azure,
        child: Text('Praca'),
        onPressed: () => notifierSubject.add(Object()),
      );
    }

    return Container();
  }
}
