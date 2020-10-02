import 'package:flutter/material.dart';
import 'package:flutterweatherapp/models/models.dart';

Widget weatherCard(Weather weather) {
  return Text(weather.status + " " + weather.description);
}
