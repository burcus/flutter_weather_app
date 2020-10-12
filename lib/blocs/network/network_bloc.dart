import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:connectivity/connectivity.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(ConnectivityInitialState());

  @override
  Stream<NetworkState> mapEventToState(NetworkEvent event) async* {
    if (event is GetConnectivity) {
      var connectivity = await (Connectivity().checkConnectivity());
      if (connectivity == ConnectivityResult.mobile ||
          connectivity == ConnectivityResult.wifi)
        yield ConnectivitySuccess();
      else
        yield ConnectivityFailed();

      Connectivity().onConnectivityChanged.listen(statusListener);
    }

    if(event is UpdateConnectivity) yield event.connectivity;
    /*
    if (event is ListenConnectivity) {
      Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult connectivity) async* {
        if (connectivity == ConnectivityResult.mobile ||
            connectivity == ConnectivityResult.wifi) {
          print("internet var");
          yield ConnectivitySuccess();
        } else {
          print("internet yok");
          yield ConnectivityFailed();
        }
      });
    }
    */
  }

  statusListener(ConnectivityResult connectivity) {
//    if(connectivity == ConnectivityResult.wifi) print("wifi");
//    if(connectivity == ConnectivityResult.none) print("none");
    if (connectivity == ConnectivityResult.wifi) {
      print("wifi");
      NetworkBloc().add(UpdateConnectivity(ConnectivitySuccess()));
    }
    if (connectivity == ConnectivityResult.none) {
      print("none");
      NetworkBloc().add(UpdateConnectivity(ConnectivityFailed()));
    }
  }
}
