import 'package:flutter_weather_bg/bg/weather_bg.dart';
import 'package:flutter_weather_bg/flutter_weather_bg.dart';
import 'package:flutterweatherapp/models/models.dart';

abstract class ThemeState {}

class ThemeInitialState extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final Weather weather;
  final WeatherType weatherType;
  ThemeLoaded(this.weatherType, this.weather);
}