import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(ConnectivityInitialState());

  StreamSubscription _subscription;
  void _watchConnectivityStatus() {
    _subscription = DataConnectionChecker().onStatusChange.listen((status) {
      add(ConnectivityChanged(status));
    });
  }

  void _unwatchConnectivityStatus() {
    _subscription?.cancel();
  }

  @override
  Stream<NetworkState> mapEventToState(NetworkEvent event) async* {
    final _state = state;
    if (event is ListenConnectivity) {
      _watchConnectivityStatus();
      return;
    }

    if (event is ConnectivityChanged) {
      final status = event.status;
      if (status == DataConnectionStatus.disconnected) {
        yield ConnectivityFailed();
        return;
      }
      // it means status is connected
      if (_state is ConnectivityFailed) {
        yield ConnectivityResumed();
        return;
      }
      yield ConnectivitySuccess();
      return;
    }

    // if (event is ListenConnectivity) {
    //   var _isConnected = false;
    //   _isConnected = await DataConnectionChecker().hasConnection;

    //   if (_isConnected)
    //     yield ConnectivitySuccess();
    //   else
    //     ConnectivityFailed();

    //   /*
    //   var connectivity = await (Connectivity().checkConnectivity());
    //   if (connectivity == ConnectivityResult.mobile || connectivity == ConnectivityResult.wifi){
    //     yield ConnectivitySuccess();
    //   }
    //   else
    //     yield ConnectivityFailed();

    //   _subscription = Connectivity().onConnectivityChanged.listen(
    //       (ConnectivityResult result) => add(UpdateConnectivity(
    //           result == ConnectivityResult.none
    //               ? ConnectivityFailed()
    //               : ConnectivitySuccess())));
    //    */
    // }

    // if (event is ConnectivityChanged) {
    //   yield event.status;
    // }
  }

  @override
  Future<void> close() {
    _unwatchConnectivityStatus();
    return super.close();
  }
}
