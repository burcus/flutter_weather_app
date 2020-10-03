import 'package:flutter/material.dart';

Widget weatherThemeContainer(BuildContext context, String imagePath) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          //colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.lighten)
      ),
    ),
    height: MediaQuery.of(context).size.height * 3 / 4,
    width: MediaQuery.of(context).size.width,
  );
}
