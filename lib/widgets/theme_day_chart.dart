import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';

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
                        text: state.weather.result[0].degree + "\u00B0",
                        //todo do it here according to state
                        style: TextStyle(fontSize: 54, color: Colors.black)));
              }
              if (state is WeatherChanged) {
                return RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: state.weather.degree + "\u00B0",
                        //todo do it here according to state
                        style: TextStyle(fontSize: 54, color: Colors.black)));
              } else
                return Text("aq");
            },
          )
        ],
      ),
    );
  }
}

/*
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherChanged) {
          var degree = state.weather.degree + "\u00B0";
        }
        if (state is WeatherLoadSuccess) {
          var degree = state.weather.result[0].degree + "\u00B0";
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.transparent,
              //borderRadius: BorderRadius.circular(50),
              //border: Border.all(width: 2),
            ),
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: state.weather.result[0].degree + "\u00B0",
                        //todo do it here according to state
                        style: TextStyle(fontSize: 54, color: Colors.black))),
              ],
            ),
          );
        } else
          return Text("s"); //todo
      },
    );
    */
