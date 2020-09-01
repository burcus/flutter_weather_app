import 'package:flutterweatherapp/models/weather_response.dart';

abstract class WeatherState {}

class InitialState extends WeatherState{}

class LoadedState extends WeatherState{
  final WeatherResponse weather;
  LoadedState(this.weather);
}

class LoadingState extends WeatherState{}