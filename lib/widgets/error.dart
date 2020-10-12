import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkBloc, NetworkState>(
      listener: (context, state) {

      },
      child: BlocBuilder<NetworkBloc, NetworkState>(
        builder: (context, state) {
          if (state is ConnectivityFailed)
            return Text("wifi problem");
          if (state is ConnectivitySuccess)
            return Text("location problem");
          else return LoadingSpinner(); //TODO animated
        },
      ),
    );
  }
}

/*
BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, state) {
        if (state is ConnectivityFailed) return Text("internet");
        else return Text("böyle bir yer yok");
      },
    );
 */

/*
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {},
      child: BlocBuilder<NetworkBloc, NetworkState>(
        builder: (context, state) {
          if (state is ConnectivityFailed)
            return Text("internet");
          else
            return Text("böyle bir yer yok");
        },
      ),
    );
 */
