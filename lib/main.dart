import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/CustomBlocObserver.dart';
import 'package:flutterweatherapp/widgets/loading_spinner.dart';
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
          create: (context) =>
          LocalizationBloc()
            ..add(CheckPermission()),
        ),
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
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
      body: MultiBlocListener(
        listeners: [
          BlocListener<LocalizationBloc, LocalizationState>(
            listener: (BuildContext context, state) {
              if (state is Always)
                context.bloc<LocalizationBloc>().add(GetLocation());
              if (state is Denied || state is LocationFailed)
                Navigator.of(context).pushReplacement(SearchScreen.route());
              if (state is LocationSucceed)
                context.bloc<WeatherBloc>().add(GetWeatherInfo(state.city));
            },
          ),
          BlocListener<WeatherBloc, WeatherState>(
            listener: (context, state) {
              if (state is WeatherLoadSuccess) {
                final weathers = state.weather.result;
                context.bloc<ThemeBloc>().add(GetTheme(weathers[0].description)); //start getting theme before navigate to listing screen
                Navigator.of(context).pushReplacement(PresentScreen.route()); //avoid back button infinitive loading spinner so don't use push
              }
            },
          ),
        ],
        child: Center(
          child: const LoadingSpinner(), //todo may remove
        ),
      ),
    );
  }
}

