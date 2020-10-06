import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

class WeatherCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadSuccess) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.14,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.weather.result.length,
                itemBuilder: (BuildContext context, int index) {
                  return new GestureDetector(
                    onTap: () {
                      print("Tıklanan description: " +
                          state.weather.result[index].description +
                          " " +
                          state.weather.result[index].degree);
                      print(state.weather.result[index].description);
                      context
                          .bloc<ThemeBloc>()
                          .add(GetTheme(state.weather.result[index]));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: weatherCard(state.weather.result[index]),
                    ),
                  );
                }),
          );
        } else
          return Text("todo"); //todo fix this issue
      },
    );
  }
}

/*
          return Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: CustomColors().weatherCardsColor,
              ),
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.weather.result.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new GestureDetector(
                      onTap: (){
                        print("Tıklanan description: " + state.weather.result[index].description + " " + state.weather.result[index].degree);
                        print(state.weather.result[index].description);
                        context.bloc<ThemeBloc>().add(GetTheme(state.weather.result[index]));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: weatherCard(state.weather.result[index]),
                      ),
                    );
                  }),
            ),
          );
 */
