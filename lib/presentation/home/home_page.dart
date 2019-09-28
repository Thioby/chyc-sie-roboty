import 'package:chyc_sie_roboty/presentation/home/home_bloc.dart';
import 'package:chyc_sie_roboty/presentation/home/home_state.dart';
import 'package:chyc_sie_roboty/util/bloc_state.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BlocState<HomePage, HomeBloc> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Witaj użytkowniku!'),
        ),
        body: SafeArea(
          child: StreamBuilder(
            stream: bloc.state,
            builder: _builder,
          ),
        ),
      );

  Widget _builder(BuildContext context, AsyncSnapshot<HomeState> snapshot) {
    final state = snapshot.data;

    if (state is ShowLoadingCards) {
      return Center(child: CircularProgressIndicator());
    }

    return Container();
  }
}
