import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/models/models.dart';
import 'weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(InitialState());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is GetWeatherInfo) {
      final res = await WeatherRequest().fetchWeathers(event.cityName);
      if(res!= null && res.success) yield WeatherLoadSuccess(res);
      else yield WeatherLoadFailed();
    }
  }
}