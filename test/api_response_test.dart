import 'package:flutter_test/flutter_test.dart';
import 'package:flutterweatherapp/repositories/weather_repository.dart';

void main(){

  test("api result", () async {
    var weatherResponse = await WeatherRepository.fetchWeathers("Samsun");
    expect(weatherResponse.result.length, 7);
  });
}
