import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/utils/utils.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                WeatherThemeImage(),
                ListingScreenSearchBar(),
                ListingScreenBody(),
                ListingScreenCards(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
