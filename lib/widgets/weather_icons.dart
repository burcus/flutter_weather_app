import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:flutterweatherapp/utils/custom_colors.dart';

class WeatherIcons extends StatelessWidget {
  final String weatherDescription;


  WeatherIcons(this.weatherDescription);

  @override
  Widget build(BuildContext context) => _mapDescriptionToIcon(weatherDescription);

  _mapDescriptionToIcon(String weatherDescription) {
    switch(weatherDescription) {
      case "açık":
        return Icon(FontAwesome5.sun, size: 20, color: CustomColors.sunny);
      case "parçalı az bulutlu":
      case "parçalı bulutlu":
        return Icon(FontAwesome5.cloud_sun, size: 20, color: CustomColors.sunCloud);
      case "az bulutlu":
      case "kapalı":
        return Icon(FontAwesome5.cloud, size: 20, color: CustomColors.cloudyGray);
      case "hafif yağmur":
        return Icon(FontAwesome5.cloud_rain, size: 20, color: CustomColors.cloudyGray);
      case "orta şiddetli yağmur":
        return Icon(FontAwesome5.cloud_showers_heavy, size: 20, color: CustomColors.flash);
      case "şiddetli yağmur":
        return Icon(Typicons.cloud_flash, size: 20, color: CustomColors.flashRain,);
      case "gece":
        return Icon(FontAwesome5.moon, size: 15, color: CustomColors.moon);
      case "nem":
        return Icon(Entypo.droplet, size: 20, color: CustomColors.moon);
    }
  }
}
