import 'package:flutter/material.dart';

class CustomColors {
  Color _lightLila = Color(0xFFd4cee4);
  Color _darkLila = Color(0xFFece4ed);
  Color _brighterGrey = Color(0xFFDEDEDE);
  Color _logoOrange = Color(0xFFffb141);
  Color _logoYellow = Color(0xFFdef716);
  Color _softYellow = Color(0xFFf2f343);
  Color _softGray = Color(0xFF252432);

  Color get logoOrange => _logoOrange;
  Color get brighterGrey => _brighterGrey;
  Color get lightLila => _lightLila;
  Color get darkLila => _darkLila;
  Color get softGray => _softGray;
  Color get logoYellow => _logoYellow;
  Color get softYellow => _softYellow;

  Color logoOrangewithOpacitiy(double opacitity) {
    return _logoOrange.withOpacity(opacitity);
  }

  Color logoYellowithOpacitiy(double opacitity) {
    return _logoYellow.withOpacity(opacitity);
  }
  //Rain

  //Clear

  //partly-cloudy
  Color _cloudyGray = Color(0xFFe5d6d1);

  Color get cloudyGray => _cloudyGray;

  Color cloudyGrayWithOpacity(double opacity) {
    return _cloudyGray.withOpacity(opacity);
  }

  //clear
  Color _clearGreen = Color(0xFF517c33);
  Color get clearGreen => _clearGreen;
  Color clearGreenWithOpacity(double opacity) {
    return _cloudyGray.withOpacity(opacity);
  }
}