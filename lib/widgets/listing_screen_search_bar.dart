import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

class ListingScreenSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadSuccess) {
          return Positioned(
              top: MediaQuery.of(context).size.height * 0.009,
              child: SearchBar());
        } else {
          return Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              child: SearchBar());
        }
      },
    );
  }
}
