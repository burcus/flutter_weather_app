import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterweatherapp/models/models.dart';
import 'package:flutterweatherapp/utils/custom_text_theme.dart';
import 'package:flutterweatherapp/utils/size_config.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  WeatherCard(this.weather);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(weather.day, style: CustomTextTheme(context).title),
          //WeatherIcons(weather.description),
          SvgPicture.network(weather.icon, height: SizeConfig.heightMultiplier * 3.2, placeholderBuilder: (context) => WeatherIcons(weather.description), semanticsLabel: "weather",),
          Text(weather.degree + "\u00B0", style: CustomTextTheme(context).subtitle),
        ],
      ),
    );
  }
}

/*
    return AspectRatio(
      aspectRatio: 4 / 5,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(weather.day, style: CustomTextTheme(context).title),
            //WeatherIcons(weather.description),
            SvgPicture.network(weather.icon, height: 20, placeholderBuilder: (context) => WeatherIcons(weather.description), semanticsLabel: "weather",),
            Text(weather.degree + "\u00B0", style: CustomTextTheme(context).subtitle),
          ],
        ),
      ),
    );
 */
