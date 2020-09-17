abstract class ThemeState {}

class ThemeInitialState extends ThemeState {}

class Theme extends ThemeState {
  String backgroundColor;
  String icon;
  String title;
}