import 'package:flutter/material.dart';
import 'package:flutterweatherapp/models/models.dart';

Widget weatherCard(Weather weather) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: AspectRatio(
      aspectRatio: 3/5,
      child: Container(
        decoration: BoxDecoration(color: Colors.black12),
        child: Text(weather.date + " " + weather.description),
      ),
    ),
  );
}
