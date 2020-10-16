import 'package:flutterweatherapp/utils/credentials.dart';

class WeatherRequest {
  static final _authorization = Credentials.apiKey;
  static final _contentType = "application/json";

  static get authorization => _authorization;
  static get contentType => _contentType;
}
