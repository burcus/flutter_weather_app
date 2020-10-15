abstract class LocalizationState {}

class LocationInitialState extends LocalizationState{}

class WhileInUse extends LocalizationState{}

class Always extends LocalizationState{}

class DeniedForever extends LocalizationState{}

class Denied extends LocalizationState{}

enum Status {CurrentLocation, LastKnownLocation}
class LocationSucceed extends LocalizationState{
   Status type;
   String city;

   LocationSucceed(this.city);
}

class LocationFailed extends LocalizationState{
  String error;
}
