import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/widgets/weather_card.dart';
import '../blocs/blocs.dart';

class PresentScreen extends StatelessWidget {
  const PresentScreen._();

  static const Theme = null;

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
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state is WeatherLoadSuccess) {
          final weather = state.weather;
          final weathers = weather.result;
          context.bloc<ThemeBloc>().add(GetTheme(weathers[0].status));
        }
      },
      child: BlocBuilder(
        cubit: context.bloc<WeatherBloc>(),
        builder: (context, state) {
          if( state is WeatherLoadSuccess) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return WeatherCard(

                );
              }
            );
          } else return Text("To Do");
        },
      ),
    );
  }
}
