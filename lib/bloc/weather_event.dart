abstract class WeatherEvent{}

class GetWeatherInfo extends WeatherEvent{
  String cityName;
  GetWeatherInfo(this.cityName);
}

class GetWeatherDetail extends WeatherEvent{}