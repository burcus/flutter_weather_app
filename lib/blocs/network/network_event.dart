import 'network_state.dart';

abstract class NetworkEvent {}

class ListenConnectivity extends NetworkEvent {}

class UpdateConnectivity extends NetworkEvent {
  NetworkState connectivity;

  UpdateConnectivity(this.connectivity);
}