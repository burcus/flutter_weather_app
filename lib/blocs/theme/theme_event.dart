abstract class ThemeEvent {}

class GetTheme extends ThemeEvent{
  String status;

  GetTheme(this.status);
}