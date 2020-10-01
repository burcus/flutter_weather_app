import 'dart:convert';
import 'dart:io';
import 'package:flutterweatherapp/models/models.dart';
import 'package:http/http.dart' as http;

class WeatherRequest {
  static final _authorization = "apikey 1wGth3eKx4cKgOAgBNJElJ:0E5OR6BHW4d7HVv9QIoebk";
  static final _contentType = "application/json";

  Future<WeatherResponse> fetchWeathers(String city) async {
    final response = await http.get(
        "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=" + city,
        headers: {
          HttpHeaders.authorizationHeader: _authorization,
          HttpHeaders.contentTypeHeader: _contentType
        });

    if (response.statusCode == 200) {
      String result = response.body;
      return WeatherResponse.fromJson(jsonDecode(result));
    } else {
      return null;
    }
  }
}