import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

class WeatherCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if(state is WeatherLoadSuccess) {
          return ListView.builder(
            itemCount: state.weather.result.length,
            itemBuilder: (BuildContext context, int index) {
                return weatherCard(state.weather.result[index]);
            },
          );
        } else return Text("todo");
      },
    );
  }
}
