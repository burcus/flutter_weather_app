import 'package:flutterweatherapp/models/models.dart';

abstract class ThemeState {}

class ThemeInitialState extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final String bgImage; //final must be known at runtime const must be known at compile time
  final Weather weather;
  ThemeLoaded(this.bgImage, this.weather);
}