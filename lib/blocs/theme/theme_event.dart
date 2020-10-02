abstract class ThemeEvent {}

class GetTheme extends ThemeEvent{
  String description;

  GetTheme(this.description);
}