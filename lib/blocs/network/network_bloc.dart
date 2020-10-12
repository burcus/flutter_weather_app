import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:connectivity/connectivity.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(ConnectivityInitialState());

  StreamSubscription _subscription;

  @override
  Stream<NetworkState> mapEventToState(NetworkEvent event) async* {
    if (event is GetConnectivity) {
      var connectivity = await (Connectivity().checkConnectivity());
      if (connectivity == ConnectivityResult.mobile ||
          connectivity == ConnectivityResult.wifi)
        yield ConnectivitySuccess();
      else
        yield ConnectivityFailed();

      _subscription = Connectivity().onConnectivityChanged.listen(
          (ConnectivityResult result) => add(UpdateConnectivity(
              result == ConnectivityResult.none
                  ? ConnectivityFailed()
                  : ConnectivitySuccess())));
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