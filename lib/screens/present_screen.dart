import 'package:flutter/material.dart';
import 'package:flutterweatherapp/models/models.dart';
import 'package:flutterweatherapp/utils/utils.dart';

class PresentScreen extends StatefulWidget {
  final WeatherResponse weatherResponse;
  PresentScreen(this.weatherResponse);

  @override
  State<StatefulWidget> createState() => PresentState();
}

class PresentState extends State<PresentScreen> {
  @override
  Widget build(BuildContext context) {
    WeatherResponse weatherResponse = this.widget.weatherResponse;
    var weathers = weatherResponse.result;

    return Scaffold(
      backgroundColor: CustomColors().softYellow,
      body: Column(
        children: <Widget>[
          Text(weatherResponse.city),
          Expanded(
            child: ListView.builder(
              itemCount: weathers.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(weathers[index].date),
                  subtitle: Text(weathers[index].description),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
