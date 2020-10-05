import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterweatherapp/models/models.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

Widget weatherCard(Weather weather) {
  return AspectRatio(
    aspectRatio: 4 / 5,
    child: Container(
      //decoration: BoxDecoration(color: Colors.black12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            weather.day,
            style: TextStyle(fontSize: 12),
          ),
          WeatherIcons(weather.description),
          Text(weather.degree + "\u00B0"),
        ],
      ),
    ),
  );
}
