import 'package:flutterweatherapp/models/models.dart';

abstract class ThemeEvent {}

class GetTheme extends ThemeEvent{
  final Weather weather;
  GetTheme(this.weather);
}