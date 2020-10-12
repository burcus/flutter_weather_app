import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, state) {
        if (state is ConnectivityFailed)
          return Text("wifi problem");
        else if (state is ConnectivitySuccess)
          return Text("location problem");
        else
          return Empty(); //TODO animated
      },
    );
  }
}
