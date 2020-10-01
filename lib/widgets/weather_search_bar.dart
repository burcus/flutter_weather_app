import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/utils/utils.dart';

class WeatherSearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(bottom: 150),
        child: FractionallySizedBox(
          heightFactor: 0.08,
          widthFactor: 0.6,
          child: SearchBarContent(),
        ),
      ),
    );
  }

}

class SearchBarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
        child: TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: (param) =>
              context.bloc<WeatherBloc>().add(GetWeatherInfo(param)),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Which city?",
              hintStyle: TextStyle(color: CustomColors().softGray),
              suffixIcon: Icon(
                Icons.search,
                color: CustomColors().softGray,
              )),
        ),
      ),
    );
  }
}

/*
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is WeatherLoadSuccess) {
          //_bloc.close();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            //get rid of error which caused by trying to change widget before it is ready not yet
            Navigator.push(context, PresentScreen.route());
          });
        }
        if(state is WeatherLoadFailed) Navigator.of(context).push(SearchScreen.route());
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
          child: TextField(
            textInputAction: TextInputAction.search,
            onSubmitted: (city) =>
                context.bloc<WeatherBloc>().add(GetWeatherInfo(city)),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Which city?",
                hintStyle: TextStyle(color: CustomColors().softGray),
                suffixIcon: Icon(
                  Icons.search,
                  color: CustomColors().softGray,
                )),
          ),
          //ClearableText
        ),
      ),
    );
  }

     */
