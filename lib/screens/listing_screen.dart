import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

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
          throw Exception("Theme state: unexpected");
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
                    return LinearGradient(colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                        .createShader(rect);
                  },
                  child: weatherThemeImage(context, imagePath)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: ThemeDayChart(),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: WeatherDetails(),
                    ),
                  )
                ],
              ),
              /*
              Align(
                alignment: Alignment.center,
                child: ThemeDayChart(),
              ),
              WeatherDetails(),
               */
            ],
          ),
          WeatherCards(),
        ],
      ),
    ),
  );
}
