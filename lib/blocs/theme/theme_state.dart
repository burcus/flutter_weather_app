import 'package:flutter/material.dart';

abstract class ThemeState {}

class ThemeInitialState extends ThemeState {}

class ThemeLoaded extends ThemeState {
  ThemeData theme;

  ThemeLoaded(this.theme);
}