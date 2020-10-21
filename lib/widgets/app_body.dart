import 'package:flutter/material.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

class AppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
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
    );
  }
}
