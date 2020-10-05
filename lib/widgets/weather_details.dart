import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/widgets/weather_icons.dart';

class WeatherDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      if (state is ThemeLoaded) {
        return Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 6,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      WeatherIcons("nem"),
                      Text(state.weather.humidity)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      WeatherIcons("gece"),
                      Text(state.weather.night+ "\u00B0")
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("En Yüksek"),
                      Text(state.weather.max)
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("En Düşük"),
                      Text(state.weather.min)
                    ],
                  ),
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

/*
Row(
      children: <Widget>[
        Column(
          children: <Widget>[],
        ),
        Column(
          children: <Widget>[],
        ),
        Column(
          children: <Widget>[],
        )
      ],
    );
 */
