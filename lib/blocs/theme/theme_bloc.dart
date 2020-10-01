import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitialState());

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) {
    var theme = new ThemeLoaded();

    if(event is GetTheme) {
      switch(event.status) {
        case "acik":
          break;
        case "":
          break;
        case "":
          break;
        case "":
          break;
      }
    }
  }
}