import 'package:flutter_test/flutter_test.dart';
import 'package:flutterweatherapp/models/weather_request.dart';

void main(){
/*
  var weatherResponse;

  setUp((){
    weatherResponse = WeatherRequest().fetchWeathers("Samsun");
  });

  tearDown((){ //register function to be run after the test finished
    weatherResponse.dispose();
  });
  */

  test("api result", () async {
    var weatherResponse = await WeatherRequest().fetchWeathers("Samsun");
    expect(weatherResponse.result.length, 7);
  });
}

//flutter test test/api_response_test.dart