import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Bloc localizationBloc;
  Bloc weatherBloc;

  HomeBloc(this.localizationBloc, this.weatherBloc) : super(null);

  StreamSubscription subscription;


  @override
  Stream<HomeState> mapEventToState(HomeEvent event) {
    if(event is StartWithLocation){
      
    }
  }
}