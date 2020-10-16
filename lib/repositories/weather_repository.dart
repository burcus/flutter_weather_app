import 'dart:convert';
import 'dart:io';
import 'package:flutterweatherapp/models/models.dart';
import 'package:http/http.dart' as http;

class WeatherRepository{

  static Future<WeatherResponse> fetchWeathers(String city) async {
    var response;
    try {
      response = await http.get(
          "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=" +
              city,
          headers: {
            HttpHeaders.authorizationHeader: WeatherRequest.authorization,
            HttpHeaders.contentTypeHeader: WeatherRequest.contentType
          });

      if (response.statusCode == 200) {
        String result = response.body;
        return WeatherResponse.fromJson(jsonDecode(result));
      } else {
        return null;
      }
    } catch (Exception) {
      return null; //TODO clean code
    }
  }
}