import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweatherapp/blocs/blocs.dart';
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
              return MessageContainer("Bir internet bağlantın olduğuna emin misin?");
            if (state is ConnectivitySuccess)
              return MessageContainer("Böyle bir yer olduğuna emin misin?");
            if (state is ConnectivityResumed)
              return MessageContainer("İşte tekrar bağlandın! Aramaya devam et.");
            return Empty(); //TODO animated
          }(),
        );
      },
    );
  }
}