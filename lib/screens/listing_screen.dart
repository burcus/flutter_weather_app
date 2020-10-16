import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/widgets/app_body.dart';

class PresentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Present();
  }
}

class _Present extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      cubit: BlocProvider.of<ThemeBloc>(context),
      builder: (context, state) {
        if (state is ThemeLoaded) {
          return AppBody(state.bgImage);
        } else
          return AppBody("assets/images/default.jpg");
      },
    );
  }
}
