import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/bloc/weather_bloc.dart';
import 'package:flutterweatherapp/bloc/weather_event.dart';
import 'package:flutterweatherapp/bloc/weather_state.dart';
import 'package:flutterweatherapp/utils/custom_colors.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(bottom: 150),
        child: FractionallySizedBox(
          heightFactor: 0.08,
          widthFactor: 0.6,
          child: BlocProvider(
            create: (context) => WeatherBloc(InitialState()),
            child: SearchBarContent(),
          ),
        ),
      ),
    );
  }
}

class SearchBarContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<WeatherBloc>(context);

    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
        child: TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: (city) => _bloc.add(GetWeatherInfo(city)),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Which city?",
              hintStyle: TextStyle(color: CustomColors().softGray),
              suffixIcon: Icon(
                Icons.search,
                color: CustomColors().softGray,
              )
          ),
        ),
        //ClearableText
      ),
    );
  }
}

/*
  children: <Widget>[
              Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        CustomColors().darkLila,
                        CustomColors().lightLila
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
                  ),
                ),
              )
            ],
 */