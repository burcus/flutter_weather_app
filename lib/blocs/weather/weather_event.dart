import 'package:flutterweatherapp/models/models.dart';

abstract class WeatherEvent{}

class GetWeatherInfo extends WeatherEvent{
  String cityName;
  GetWeatherInfo(this.cityName);
}

class ChangeThemeWeather extends WeatherEvent{
  Weather weather;
  ChangeThemeWeather(this.weather);
}
