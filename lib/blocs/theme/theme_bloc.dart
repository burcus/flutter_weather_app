import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/utils/custom_colors.dart';
import 'theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitialState());

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if(event is GetTheme) {
      String image;
      Color primaryColor, imageFilterColor;
      ThemeLoaded theme;
      switch(event.description) {
        case "kapalı":
          image = "overcast";
          break;
        case "parçalı az bulutlu":
          image = "partly-cloudy";
          break;
        case "az bulutlu":
          image = "partly-cloudy-more-clear";
          break;
        case "orta şiddetli yağmur":
        case "hafif yağmur":
          image = "rain";
          break;
        case "açık":
          image = "clear";
          break;
        case "parçalı bulutlu":
          image = "cloud";
          primaryColor = CustomColors().cloudyGray;
          break;
        case "şiddetli yağmur":
          image = "thunder";
          break;
      }
      String imagePath = "assets/images/weather_status/" + image + ".jpg";
      //yield ThemeLoaded(imagePath, primaryColor);
      yield ThemeLoaded(imagePath);
    }
  }
}