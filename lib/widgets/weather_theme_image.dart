import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/utils/size_config.dart';
import 'package:flutterweatherapp/widgets/weather_background.dart';

class WeatherThemeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        if (state is ThemeLoaded) {
          return Container(child: WeatherBackground(state.weatherType));
        } else {
          return Container(
            height: SizeConfig.heightMultiplier * 100,
            width: SizeConfig.widthMultiplier * 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/default.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          );
        }
      },
    );
  }
}