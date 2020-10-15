import 'package:flutterweatherapp/models/models.dart';

abstract class ThemeState {}

class ThemeInitialState extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final String bgImage;
  final Weather weather;
  ThemeLoaded(this.bgImage, this.weather);
}