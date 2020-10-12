import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterweatherapp/models/models.dart';
import 'package:flutterweatherapp/utils/custom_text_theme.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

class weatherCard extends StatelessWidget {
  final Weather weather;

  weatherCard(this.weather);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 5,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(weather.day, style: CustomTextTheme(context).title),
            Image.network(weather.icon),
            //WeatherIcons(weather.description),
            SvgPicture.network(weather.icon, height: 20, placeholderBuilder: (context) => WeatherIcons(weather.description), semanticsLabel: "weather",),
            Text(weather.degree + "\u00B0", style: CustomTextTheme(context).subtitle),
          ],
        ),
      ),
    );
  }
}
