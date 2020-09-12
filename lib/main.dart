import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/CustomBlocObserver.dart';
import 'screens/screens.dart';
import 'blocs/blocs.dart';


void main() {
  Bloc.observer = CustomBlocObserver();
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
      body: BlocConsumer(
          listener: (BuildContext context, state) {
            if(state is LocationInitialState) _locationBloc.add(CheckPermission());
            if(state is Always) _locationBloc.add(GetLocation());
            if(state is LocationSucceed) _weatherBloc.add(GetWeatherInfo(state.city));
          },
          builder: (BuildContext context, state){
            if(state is LocationFailed) return SearchScreen();
            if(state is LoadedState) return PresentScreen(state.weather);
            else return CircularProgressIndicator();
          }
      ),
      //todo use bloc consumer
/*      body: BlocBuilder(
        cubit: _locationBloc,
        builder: (context, state) {
          if(state is LocationInitialState) _locationBloc.add(CheckPermission());
          if(state is Always) _locationBloc.add(GetLocation());
          if(state is LocationFailed) return SearchScreen();
          if(state is LocationSucceed) _weatherBloc.add(GetWeatherInfo(state.city));
          if(state is LoadedState) return PresentScreen(state.weather);
          return CircularProgressIndicator();
        },
      ),*/
    );
  }
}


/*
Scaffold(
      body: BlocBuilder(
        cubit: _locationBloc,
        builder: (context, state) {
          if(state is LocationInitialState) _locationBloc.add(CheckPermission());
          if(state is Always) _locationBloc.add(GetLocation());
          if(state is LocationFailed) return SearchScreen();
          if(state is LocationSucceed) _weatherBloc.add(GetWeatherInfo(state.city));
          if(state is LoadedState)  return PresentScreen(state.weather);
          return CircularProgressIndicator();
        },
      ),
    );
 */

/*
      body: BlocBuilder(
        cubit: _locationBloc,
        builder: (context, state) {
          if(state is LocationInitialState) _locationBloc.add(CheckPermission());
          if(state is Always) _locationBloc.add(GetLocation());
          if(state is LocationFailed) return SearchScreen();
          if(state is LocationSucceed) return Text("weather bloca gitmeli"); //_weatherBloc.add(GetWeatherInfo(state.city));
          if(state is LoadedState)  return PresentScreen(state.weather);
          print(state);
          return CircularProgressIndicator();
        },
      ),
 */

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
