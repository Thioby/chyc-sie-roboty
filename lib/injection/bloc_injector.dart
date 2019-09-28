import 'package:chyc_sie_roboty/util/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

class BlocInjector extends InheritedWidget {
  final Injector _injector;

  BlocInjector(
      this._injector, {
        Key key,
        @required Widget child,
      })  : assert(child != null),
        super(key: key, child: child);

  static BlocInjector of(BuildContext context) => context.inheritFromWidgetOfExactType(BlocInjector);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => this != oldWidget;

  T inject<T extends Bloc>() => _injector.getDependency<T>();
}
