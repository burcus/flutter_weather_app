import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_bg/flutter_weather_bg.dart';
import 'theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitialState());

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if(event is GetTheme) {
      WeatherType weatherType;

      switch(event.weather.description) {
        case "kapalı":
          weatherType = WeatherType.overcast;
          break;
        case "az bulutlu":
        case "parçalı az bulutlu":
        case "parçalı bulutlu":
          weatherType = WeatherType.cloudy;
          break;
        case "hafif yağmur":
          weatherType = WeatherType.lightRainy;
          break;
        case "orta şiddetli yağmur":
          weatherType = WeatherType.middleRainy;
          break;
        case "açık":
          weatherType = WeatherType.sunny;
          break;
        case "şiddetli yağmur":
          weatherType = WeatherType.heavyRainy;
          break;
      }
      yield ThemeLoaded(weatherType, event.weather);
    }
  }
}