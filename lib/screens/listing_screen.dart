import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/widgets/theme_day_chart.dart';
import 'package:flutterweatherapp/widgets/weather_cards.dart';
import 'package:flutterweatherapp/widgets/weather_theme_container.dart';

class PresentScreen extends StatelessWidget {
  const PresentScreen._();

  @override
  Widget build(BuildContext context) {
    return const _Present();
  }

  static Route route() => MaterialPageRoute(
        builder: (_) => const PresentScreen._(),
      );
}

class _Present extends StatelessWidget {
  const _Present();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      cubit: BlocProvider.of<ThemeBloc>(context),
      builder: (context, state) {
        if (state is ThemeLoaded) {
          return cover(context, state.bgImage);
        } else
          return Text("tema yüklenmedi"); //todo
      },
    );
  }
}

Widget cover(BuildContext context, String imagePath) {
  //TODO return LayoutBuilder();
  return Scaffold(
    body: SafeArea(
      top: true,
      bottom: true,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(colors: [Colors.white.withOpacity(0.9), Colors.white.withOpacity(0)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter).createShader(rect);
                },
                  child: weatherThemeContainer(context, imagePath)
              ),
              Align(
                child: ThemeDayChart(),
              )
            ],
          ),
          WeatherCards(),
        ],
      ),
    ),
  );
}
