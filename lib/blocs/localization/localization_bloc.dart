import 'package:flutter_bloc/flutter_bloc.dart';
import 'localization.dart';
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
      yield GetStateClass(locationPermission);
    } else if (event is RequestPermission){
      LocationPermission permission = await requestPermission();
      yield GetStateClass(permission);
      /*
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
       */
    } else if (event is GetLocation){
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high).catchError((error) => print(error)).catchError((error) => print(error));
      //Position lastKnown = await getLastKnownPosition();
      if(position == null || (position.latitude == 0.0 && position.longitude == 0.0)) position = await getLastKnownPosition();  //If current position is not significant use last known position
      var coordinates = new Coordinates(position.latitude, position.longitude);
      var city;
      try {
        var location = await Geocoder.local.findAddressesFromCoordinates(coordinates);
        city = splitAddressLine(location.first.addressLine);
        yield LocationSucceed(city);
      }
      catch (error) {
        print(error);
        yield LocationFailed();
      }
    }
  }

  String splitAddressLine(String address){
    var sp = address.split(",");
    return sp[sp.length-2].split("/").removeLast();
  }

  LocalizationState GetStateClass(LocationPermission permission){
    //print("PERMISSION:  " + permission.toString());
    switch (permission){
      case LocationPermission.always:
        return Always();
        break;
      case LocationPermission.denied:
        return Denied();
        break;
      case LocationPermission.deniedForever:
        return DeniedForever();
        break;
      case LocationPermission.whileInUse:
        return WhileInUse();
    }
  }
}