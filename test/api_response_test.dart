import 'package:flutter_test/flutter_test.dart';
import 'package:flutterweatherapp/models/weather_request.dart';

void main(){
  test("api result", () async {
    var result = await WeatherRequest().fetchWeathers("Samsun");
    expect("result length must be bigger than 0", result.result.length);
  });
}