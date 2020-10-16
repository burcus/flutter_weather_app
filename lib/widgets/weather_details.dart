import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/utils/custom_text_theme.dart';
import 'package:flutterweatherapp/utils/utils.dart';
import 'package:flutterweatherapp/widgets/weather_icons.dart';

class WeatherDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      if (state is ThemeLoaded) {
        return Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 6,
          /*
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(width: 2),
          ),
           */
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(Strings.higherDegree, style: CustomTextTheme(context).display3),
                      Text(state.weather.max + "\u00B0", style: CustomTextTheme(context).display4)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(Strings.lowerDegree, style: CustomTextTheme(context).display3),
                      Text(state.weather.min + "\u00B0", style: CustomTextTheme(context).display4)
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      WeatherIcons("nem"),
                      VerticalDivider(width: 5),
                      Text(state.weather.humidity, style: CustomTextTheme(context).display4)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      WeatherIcons("gece"),
                      VerticalDivider(width: 7),
                      Text(state.weather.night + "\u00B0", style: CustomTextTheme(context).display4)
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      } else
        throw Exception("Weather detail can't fetch");
    });
  }
}