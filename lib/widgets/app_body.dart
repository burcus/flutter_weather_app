import 'package:flutter/material.dart';
import 'package:flutterweatherapp/utils/utils.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

class AppBody extends StatelessWidget {
  final String imagePath;

  AppBody(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                                colors: [
                              CustomColors.softGray.withOpacity(0.9),
                              CustomColors.softGray.withOpacity(0.8),
                              //Colors.white.withOpacity(0.5),
                            ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)
                            .createShader(rect);
                      },
                      child: weatherThemeImage(context, imagePath)),
                  ListingScreenSearchBar(),
                  ListingScreenBody(),
                  ListingScreenCards(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
