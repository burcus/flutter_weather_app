import 'package:flutter/material.dart';

Widget weatherThemeImage(BuildContext context, String imagePath) {
  var safeAreaPadding = MediaQuery.of(context).padding;
  var safeAreaHeight = MediaQuery.of(context).size.height- safeAreaPadding.top - safeAreaPadding.bottom;
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
    height: safeAreaHeight, //MediaQuery.of(context).size.height not working cause safe area
    width: MediaQuery.of(context).size.width,
  );
}
