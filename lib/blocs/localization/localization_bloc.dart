import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/localization/localization_event.dart';
import 'package:flutterweatherapp/blocs/localization/localization_state.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc(LocalizationState initialState) : super(initialState);

  @override
  Stream<LocalizationState> mapEventToState(LocalizationEvent event) async*{
    if(event is CheckPermission){
      LocationPermission locationPermission = await checkPermission();
      //switch (locationPermission){}
      print(locationPermission);
    } else if (event is RequestPermission){
      LocationPermission permission = await requestPermission();
      print("PERMISSION:  " + permission.toString());
      switch (permission){
        case LocationPermission.always:
          yield Always();
          break;
        case LocationPermission.denied:
          yield Denied();
          break;
        case LocationPermission.deniedForever:
          yield DeniedForever();
          break;
        case LocationPermission.whileInUse:
          yield WhileInUse();
      }
    } else if (event is GetLocation){
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high).catchError((error) => print(error)).catchError((error) => print(error));
      //Position lastKnown = await getLastKnownPosition();
      if(position == null || (position.latitude == 0.0 && position.longitude == 0.0)) position = await getLastKnownPosition();  //If current position is not significant use last known position
      var coordinates = new Coordinates(position.latitude, position.longitude);
      var location = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var city = splitAddressLine(location.first.addressLine);
      //var city = address[address.length-2].split("/")[];
      print("city" + city);
      if((position.latitude == 0.0 && position.altitude == 0.0) || position == null){ //Gps is not active
        yield LocationFailed();
      } else {
        yield LocationSucceed(city);
      }
    }
  }

  String splitAddressLine(String address){
    var sp = address.split(",");
    return sp[sp.length-2].split("/").removeLast();
  }
}