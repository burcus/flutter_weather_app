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
//      width: MediaQuery.of(context).size.width * 0.98,
      width: SizeConfig.widthMultiplier * 98,
//      height: MediaQuery.of(context).size.height * 0.05,
      height: SizeConfig.heightMultiplier * 5,
      decoration: BoxDecoration(
        color: Colors.black54.withOpacity(0.2),
        border: Border.all(width: 2, color: Colors.white.withOpacity(0.08)),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: InputText(),
    );
  }
}
