import 'package:flutter/material.dart';

abstract class ThemeState {}

class ThemeInitialState extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final String bgImage; //final must be known at runtime const must be known at compile time
  //final Color primaryColor;


  //ThemeLoaded(this.bgImage, this.primaryColor);




  ThemeLoaded(this.bgImage);
}