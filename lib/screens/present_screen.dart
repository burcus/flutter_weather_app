import 'package:flutter/material.dart';
import 'package:flutterweatherapp/utils/custom_colors.dart';

class PresentScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => PresentState();
}

class PresentState extends State<PresentScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().softYellow,
      body: Text("present"),
    );
  }
  
}