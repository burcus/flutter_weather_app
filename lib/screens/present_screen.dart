import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/utils/utils.dart';
import 'package:flutterweatherapp/widgets/loading_spinner.dart';

import '../blocs/blocs.dart';

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
    return Scaffold(
      backgroundColor: CustomColors().softYellow,
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is LoadedState) {
            final weather = state.weather;
            final weathers = weather.result;
            return Column(
              children: <Widget>[
                Text(weather.city),
                Expanded(
                  child: ListView.builder(
                    itemCount: weathers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(weathers[index].date),
                        subtitle: Text(weathers[index].description),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const LoadingSpinner();
        },
      ),
    );
  }
}
