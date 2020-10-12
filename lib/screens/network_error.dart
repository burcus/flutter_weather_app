import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';

class NetworkErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _NetworkError();
}

class _NetworkError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkState>(
        builder: (context, state) {
          if(state is ConnectivityFailed) return Center(child: Text("none"));
          if(state is ConnectivitySuccess) return Center(child: Text("wifi"));
          else return Center(child: Text(state.toString()));
        }
    );
  }
}