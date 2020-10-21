import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/utils/size_config.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

class ListingScreenSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadSuccess) {
          return Positioned(
              top: SizeConfig.safeAreaVertical * 1.2, child: SearchBar());
        } else {
          return Positioned(
              top: SizeConfig.heightMultiplier * 35,
              child: Column(
                children: [
                  Container(
                    width: SizeConfig.widthMultiplier * 100,
                    height: SizeConfig.heightMultiplier * 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo_transparent.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SearchBar()
                ],
              ));
        }
      },
    );
  }
}
