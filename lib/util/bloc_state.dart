import 'package:chyc_sie_roboty/injection/bloc_injector.dart';
import 'package:chyc_sie_roboty/util/bloc.dart';
import 'package:flutter/material.dart';

abstract class BlocState<T extends StatefulWidget, B extends Bloc> extends State<T> {
  B _bloc;

  B get bloc => _bloc;

  @override
  void didChangeDependencies() {
    if (bloc == null) {
      _bloc = BlocInjector.of(context).inject<B>();
      afterBlocInit();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc?.dispose();
    super.dispose();
  }

  void afterBlocInit() {}
}
