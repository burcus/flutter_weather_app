import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkEvent {
  const NetworkEvent();
}

class ListenConnectivity extends NetworkEvent {}

class ConnectivityChanged extends NetworkEvent {
  const ConnectivityChanged(this.status);

  final DataConnectionStatus status;
}

class UpdateConnectivityState extends NetworkEvent {}