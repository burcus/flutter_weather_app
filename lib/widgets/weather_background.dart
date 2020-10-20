import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_bg/flutter_weather_bg.dart';
import 'package:flutterweatherapp/utils/utils.dart';

// ignore: must_be_immutable
class WeatherBackground extends StatelessWidget {
  WeatherType _weatherType;

  WeatherBackground(this._weatherType);

  @override
  Widget build(BuildContext context) {
    return WeatherBg(
        width: SizeConfig.widthMultiplier * 100,
        height: SizeConfig.heightMultiplier * 100,
        weatherType: _weatherType);
  }
}
