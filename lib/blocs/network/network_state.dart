abstract class NetworkState {}

class ConnectivityInitialState extends NetworkState {}

class ConnectivitySuccess extends NetworkState {}

class ConnectivityResumed extends NetworkState {}

class ConnectivityFailed extends NetworkState {}
