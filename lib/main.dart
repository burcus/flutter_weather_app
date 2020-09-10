import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/localization/localization_bloc.dart';
import 'package:flutterweatherapp/blocs/localization/localization_event.dart';
import 'package:flutterweatherapp/blocs/localization/localization_state.dart';
import 'package:flutterweatherapp/blocs/weather/weather_event.dart';
import 'package:flutterweatherapp/screens/present_screen.dart';
import 'package:flutterweatherapp/screens/search_screen.dart';

import 'blocs/weather/weather_bloc.dart';
import 'blocs/weather/weather_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LocalizationBloc(LocationInitialState()),
          ),
          BlocProvider(
            create: (context) => WeatherBloc(InitialState()),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
/*
BlocProvider(
        create: (context) => LocalizationBloc(InitialState()),
        child: HomePage(),
      ),
 */

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _locationBloc = BlocProvider.of<LocalizationBloc>(context);
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      body: BlocBuilder(
        cubit: _locationBloc,
        builder: (context, state) {
          return Center(
            child: SearchScreen(),
          );
          /*
          //state switch case maybe
          //_locationBloc.add(CheckPermission());
          if (state is Always || state is WhileInUse) {
            _locationBloc.add(GetLocation());
            return Text("Konumlu Detay Sayfası");
          } else if (state is LocationInitialState) {
            //_locationBloc.add(CheckPermission());
            _locationBloc.add(RequestPermission());
            return CircularProgressIndicator();
          } else if (state is LocationSucceed) {
            _weatherBloc.add(GetWeatherInfo(state.city));
            return Text(state.city);
          } else if (state is LoadedState) {
            return PresentScreen(state.weather);
          } else if (state is LoadedState) {
            return PresentScreen(state.weather);
          } else {
            //denied, deniedForever or LocationFailed
            _locationBloc.close();
            return Center(
              child: SearchScreen(),
            );
          } */
          print(state);
          /*
          if (state is Denied) _locationBloc.add(RequestPermission());
          if(state is Always || state is WhileInUse) _locationBloc.add(GetLocation());
          if(state is LocationSucceed) _weatherBloc.add(GetWeatherInfo(state.city));
          if(state is LoadedState) return Text("oldu");
          //return CircularProgressIndicator();
          return Text(state.toString());

           */
        },
      ),
    );
  }
}

/*
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<LocalizationBloc>(context);
    return Scaffold(
      body: BlocBuilder(
        cubit: _bloc,
        builder: (context, state){
          _bloc.add(CheckPermission());
          return Center(
            child: SearchScreen(),
          );
        },
      ));
  }
}

 */

/*
Center(
        child: SearchScreen()
    )
 */
