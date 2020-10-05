import 'package:flutter/material.dart';

Widget weatherThemeImage(BuildContext context, String imagePath) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
      ),
    ),
    height: MediaQuery.of(context).size.height * 0.82,
    width: MediaQuery.of(context).size.width,
  );
}
