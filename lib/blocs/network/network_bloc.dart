import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:connectivity/connectivity.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(ConnectivityInitialState());

  StreamSubscription _subscription;

  @override
  Stream<NetworkState> mapEventToState(NetworkEvent event) async* {
    if (event is ListenConnectivity) {
      var _isConnected = false;
      _isConnected = await DataConnectionChecker().hasConnection;

      if (_isConnected)
        yield ConnectivitySuccess();
      else
        ConnectivityFailed();

      _subscription = DataConnectionChecker().onStatusChange.listen((status) {
        add(UpdateConnectivity(status == DataConnectionStatus.connected
            ? ConnectivitySuccess()
            : ConnectivityFailed()));
      });

      /*
      var connectivity = await (Connectivity().checkConnectivity());
      if (connectivity == ConnectivityResult.mobile || connectivity == ConnectivityResult.wifi){
        yield ConnectivitySuccess();
      }
      else
        yield ConnectivityFailed();

      _subscription = Connectivity().onConnectivityChanged.listen(
          (ConnectivityResult result) => add(UpdateConnectivity(
              result == ConnectivityResult.none
                  ? ConnectivityFailed()
                  : ConnectivitySuccess())));
       */
    }

    if (event is UpdateConnectivity) {
      yield event.connectivity;
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
