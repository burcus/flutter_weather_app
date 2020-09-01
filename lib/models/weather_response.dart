import 'package:flutterweatherapp/models//weather.dart';

class WeatherResponse {
  bool success;
  String city;

  //List<Weather> result;
  List<dynamic> result;

  WeatherResponse({this.success, this.city, this.result});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    var weathersFromJson = json['result'] as List<dynamic>;
    List<Weather> weatherList = List<Weather>();
    weathersFromJson.forEach((element) {
      Weather weather = Weather.fromJson(element);
      weatherList.add(weather);
    });

    return WeatherResponse(
        success: json['success'] as bool,
        city: json['city'] as String,
        result: weatherList
      //result: json['result'] as List<dynamic>
    );
  }
}