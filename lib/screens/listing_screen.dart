import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/widgets/weather_cards.dart';

class PresentScreen extends StatelessWidget {
  const PresentScreen._();

  @override
  Widget build(BuildContext context) {
    return const _Present();
  }

  static Route route() => MaterialPageRoute(
        builder: (_) => const PresentScreen._(),
      );
}

class _Present extends StatelessWidget {
  const _Present();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      cubit: BlocProvider.of<ThemeBloc>(context),
      builder: (context, state) {
        if (state is ThemeLoaded) {
          return cover(context);
        } else return Text("tema yüklenmedi"); //todo
      },
    );
  }
}

Widget cover(BuildContext context) {
  //TODO return LayoutBuilder();
  return Scaffold(
    body: SafeArea(
      top: true,
      bottom: true,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              //color: bgColor,
            ),
            height: MediaQuery.of(context).size.height * 3 / 5,
            width: MediaQuery.of(context).size.width,
            child: Text("test"),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
              ),
              child: WeatherCards(),
            ),
          ),
        ],
      ),
    ),
  );
}
