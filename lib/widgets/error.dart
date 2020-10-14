import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: () {
            if (state is ConnectivityFailed) return Text("wifi problem");
            if (state is ConnectivitySuccess) return Text("location problem");
            if (state is ConnectivityResumed)
              return Text('welcome back online');
            return Empty(); //TODO animated
          }(),
        );
      },
    );
  }
}
