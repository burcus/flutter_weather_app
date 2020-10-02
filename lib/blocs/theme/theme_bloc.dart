import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitialState());

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if(event is GetTheme) {
      String imagePath = "assets/images/weather_status";
      ThemeLoaded theme;
      switch(event.description) {
        case "kapalı":
          imagePath += "overcast";
          break;
        case "parçalı az bulutlu":
          imagePath += "partly-cloudy";
          break;
        case "az bulutlu":
          imagePath += "partly-cloudy-more-clear";
          break;
        case "hafif yağmur":
          imagePath += "rain";
          break;
        case "açık":
          imagePath += "clear";
          break;
        case "parçalı bulutlu":
          imagePath += "cloud";
          break;
        case "orta şiddetli yağmur":
        case "şiddetli yağmur":
          imagePath += "thunder";
          break;
      }
      yield ThemeLoaded(imagePath);
    }
  }
}