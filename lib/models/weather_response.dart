import 'package:flutterweatherapp/models/models.dart';

class WeatherResponse {
  bool success;
  String city;

  List<dynamic> result;

  WeatherResponse({this.success, this.city, this.result});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    var weathersFromJson = json['result'];
    var weatherList = <Weather>[];

    for (var element in weathersFromJson) {
      Weather weather = Weather.fromJson(element);
      weatherList.add(weather);
    }

    return WeatherResponse(
        success: json['success'] as bool,
        city: json['city'] as String,
        result: weatherList);
  }
}
