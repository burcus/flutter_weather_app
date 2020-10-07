import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/utils/custom_colors.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

class PresentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Present();
  }
}

class _Present extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      cubit: BlocProvider.of<ThemeBloc>(context),
      builder: (context, state) {
        if (state is ThemeLoaded) {
          return cover(context, state.bgImage);
        } else
          return cover(context, "assets/images/default.jpg");
      },
    );
  }
}

Widget cover(BuildContext context, String imagePath) {
  //TODO fix bottom overflow causes by keyboard
  return Scaffold(
    body: SafeArea(
      top: true,
      bottom: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                              colors: [
                            CustomColors().softGray.withOpacity(0.9),
                            CustomColors().softGray.withOpacity(0.8),
                            //Colors.white.withOpacity(0.5),
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          .createShader(rect);
                    },
                    child: weatherThemeImage(context, imagePath)),
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherLoadSuccess) {
                      return Positioned(
                          top: MediaQuery.of(context).size.height * 0.009,
                          child: SearchBar());
                    } else {
                      return Positioned(
                          top: MediaQuery.of(context).size.height * 0.35,
                          child: SearchBar());
                    }
                  },
                ),
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherLoadSuccess) {
                      return Column(
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
                      );
                    } else {
                      return Empty();
                    }
                  },
                ),
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherLoadSuccess) {
                      return Positioned(bottom: 0, child: WeatherCards());
                    } else
                      return Empty();
                  },
                )
                //TODO navigate network error page
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
