import 'package:flutterweatherapp/models/weather_response.dart';

abstract class WeatherState {}

class InitialState extends WeatherState{}

class WeatherLoadSuccess extends WeatherState{
  final WeatherResponse weather;
  WeatherLoadSuccess(this.weather);
}

class WeatherLoadFailed extends WeatherState{}