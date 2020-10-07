import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:connectivity/connectivity.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(ConnectivityInitialState());

  @override
  Stream<NetworkState> mapEventToState(NetworkEvent event) async* {
    if (event is GetConnectivity) {
      var connectivity = await (Connectivity().checkConnectivity());
      if(connectivity == ConnectivityResult.mobile || connectivity == ConnectivityResult.wifi) yield ConnectivitySuccess();
      else yield ConnectivityFailed();
    }
  }
}
