import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_bg/flutter_weather_bg.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/widgets/weather_background.dart';

class WeatherThemeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        if (state is ThemeLoaded) {
          return Container(child: WeatherBackground(state.weatherType));
        } else {
          return Container(child: WeatherBackground(WeatherType.sunnyNight));
        }
      },
    );
  }
}