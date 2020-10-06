import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/utils/custom_colors.dart';
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
    //backgroundColor: CustomColors().scaffoldBg.withOpacity(0.7),
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
                      CustomColors().softGray.withOpacity(0.9),
                      CustomColors().softGray.withOpacity(0.8),
                      //Colors.white.withOpacity(0.5),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                        .createShader(rect);
                  },
                  child: weatherThemeImage(context, imagePath)),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.009,
                child: SearchBar(),
              ),
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
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: WeatherCards(),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
