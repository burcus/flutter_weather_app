import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/CustomBlocObserver.dart';
import 'blocs/blocs.dart';
import 'screens/screens.dart';

void main() {
  Bloc.observer = CustomBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsApp.debugAllowBannerOverride = false;
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalizationBloc>(
          create: (context) => LocalizationBloc()..add(CheckPermission()),
        ),
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<NetworkBloc>(
          create: (context) => NetworkBloc()..add(ListenConnectivity()),
        ),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(listeners: [
        BlocListener<LocalizationBloc, LocalizationState>(
          listener: (BuildContext context, state) {
            if (state is Always)
              context.bloc<LocalizationBloc>().add(GetLocation());
            if (state is LocationSucceed)
              context.bloc<WeatherBloc>().add(GetWeatherInfo(state.city));
          },
        ),
        BlocListener<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherLoadSuccess) {
              final weathers = state.weather.result;
              context.bloc<ThemeBloc>().add(GetTheme(weathers[
                  0])); //start getting theme before navigate to listing screen
              //Navigator.of(context).pushReplacement(PresentScreen.route()); //avoid back button infinitive loading spinner so don't use push
            } //TODO network problem
          },
        ),
      ], child: PresentScreen()),
    );
  }
}
