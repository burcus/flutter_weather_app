import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/weather/weather_event.dart';
import 'package:flutterweatherapp/blocs/weather/weather_state.dart';
import 'package:flutterweatherapp/models/weather_request.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  WeatherBloc(initialState) : super(initialState);

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {

    if (event is GetWeatherInfo) {
      final res = await WeatherRequest().fetchWeathers(event.cityName);
      yield LoadedState(res);
    }
  }
}