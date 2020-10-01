import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitialState());

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if(event is GetTheme) {
      ThemeData theme = ThemeData(
        accentColor: Colors.black12,
        primaryColor: Colors.black,
      );
      switch(event.status) {
        case "Clear":
          theme = ThemeData(
            accentColor: Colors.amberAccent,
            primaryColor: Colors.amber,
          );
          break;
        case "Rain":
          theme = ThemeData(
            accentColor: Colors.indigoAccent,
            primaryColor: Colors.indigo,
          );
          break;
      }
      yield ThemeLoaded(theme);
    }
  }
}