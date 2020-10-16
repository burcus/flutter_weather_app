import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
import 'package:flutterweatherapp/utils/utils.dart';
import 'package:flutterweatherapp/widgets/message_container.dart';
import 'package:flutterweatherapp/widgets/widgets.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          child: () {
            if (state is ConnectivityFailed)
              return MessageContainer(Strings.networkFailureText);
            if (state is ConnectivitySuccess)
              return MessageContainer(Strings.locationFailureText);
            if (state is ConnectivityResumed)
              return MessageContainer(Strings.networkBackText);
            return Empty(); //TODO animated
          }(),
        );
      },
    );
  }
}