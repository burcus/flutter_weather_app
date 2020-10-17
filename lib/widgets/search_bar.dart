import 'package:flutter/material.dart';
import 'package:flutterweatherapp/utils/size_config.dart';
import 'package:flutterweatherapp/widgets/input_text.dart';

class SearchBar extends StatelessWidget {
  Widget build(BuildContext context) => SearchBarContent();
}

class SearchBarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.widthMultiplier * 50,
      height: SizeConfig.heightMultiplier * 5,
      child: InputText(),
    );
  }
}
