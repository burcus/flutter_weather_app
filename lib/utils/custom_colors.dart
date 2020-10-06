import 'package:flutter/material.dart';

class CustomColors {
  Color _lightLila = Color(0xFFd4cee4);
  Color _darkLila = Color(0xFFece4ed);
  Color _brighterGrey = Color(0xFFDEDEDE);
  Color _logoOrange = Color(0xFFffb141);
  Color _logoYellow = Color(0xFFdef716);
  Color _softYellow = Color(0xFFf2f343);
  Color _softGray = Color(0xFF252432);
  Color _scaffoldBg = Color(0xFFe6e6e6);
  Color _clearGreen = Color(0xFF517c33);
  Color _weatherCardsColor = Color(0xFFc2c2bb);

  Color get scaffoldBg => _scaffoldBg;
  Color get logoOrange => _logoOrange;
  Color get brighterGrey => _brighterGrey;
  Color get lightLila => _lightLila;
  Color get darkLila => _darkLila;
  Color get softGray => _softGray;
  Color get logoYellow => _logoYellow;
  Color get softYellow => _softYellow;
  Color get clearGreen => _clearGreen;
  Color get weatherCardsColor => _weatherCardsColor;


  Color logoOrangewithOpacitiy(double opacitity) => _logoOrange.withOpacity(opacitity);

  Color logoYellowithOpacitiy(double opacitity) => _logoYellow.withOpacity(opacitity);

  Color clearGreenWithOpacity(double opacity) => _cloudyGray.withOpacity(opacity);

  Color cloudyGrayWithOpacity(double opacity) => _cloudyGray.withOpacity(opacity);

  //Icons

  Color _flashRain = Color(0xFF747e8c);
  Color _cloudyGray = Color(0xFF92d6f7);
  Color _humidity = Color(0xFFb4dfed);
  Color _moon = Color(0xFFdcedf2);
  Color _sunCloud = Color(0xFFdae8ed);
  Color _sunny = Color(0xFFfffa66);

  Color get sunny => _sunny;
  Color get sunCloud => _sunCloud;
  Color get moon => _moon;
  Color get humidity => _humidity;
  Color get flashRain => _flashRain; //Clear
  Color get cloudyGray => _cloudyGray;



}