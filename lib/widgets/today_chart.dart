import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';

class TodayChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadSuccess) {
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
                        style: TextStyle(fontSize: 54, color: Colors.black))),
              ],
            ),
          );
        } else
          return Text("s"); //todo
      },
    );
  }
}
