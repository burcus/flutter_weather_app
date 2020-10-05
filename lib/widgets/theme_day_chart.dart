import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/utils/utils.dart';

class ThemeDayChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        //border: Border.all(width: 2),
      ),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoadSuccess) {
                return RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: state.weather.city.toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            color:
                                Colors.black))); //TODO make fontsize responsive
              } else
                throw Exception("Weather cityName: unexcepted");
            },
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              if (state is ThemeLoaded) {
                return RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: state.weather.degree + "\u00B0 \n",
                          style: TextStyle(fontSize: 60, color: Colors.black)),
                      TextSpan(
                          text: state.weather.description.capitalize(),
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                    ],
                  ),
                );
              } else
                throw Exception("Theme state: unexpected");
            },
          ),
        ],
      ),
    );
  }
}
