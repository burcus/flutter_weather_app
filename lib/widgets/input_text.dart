import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/utils/utils.dart';

class InputText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      textInputAction: TextInputAction.search,
      onSubmitted: (param) =>
          context.bloc<WeatherBloc>().add(GetWeatherInfo(param)),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "",
          hintStyle: CustomTextTheme(context).body1,
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white70,
          )),
    );
  }
}
