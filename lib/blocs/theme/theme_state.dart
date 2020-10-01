import 'package:flutter/material.dart';

abstract class ThemeState {}

class ThemeInitialState extends ThemeState {}

class ThemeLoaded extends ThemeState {
  ThemeData theme;
  String backgroundColor;
  String icon;
  String title;
}