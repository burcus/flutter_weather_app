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
              if (state is LocationSucceed)
                context.bloc<WeatherBloc>().add(GetWeatherInfo(state.city));
              if (state is LocationFailed)
                Navigator.of(context).push(SearchScreen.route());
            },
          ),
          BlocListener<WeatherBloc, WeatherState>(
            listener: (context, state) {
              if (state is WeatherLoadSuccess)
                Navigator.of(context).push(PresentScreen.route());
              if (state is WeatherLoadFailed)
                Navigator.of(context).push(SearchScreen.route());
            },
            //TODO: navigate to error page
          ),
        ],
        child: Center(
          child: const LoadingSpinner(),
        ),
      ),

      //todo use bloc consumer

    );
  }
}

