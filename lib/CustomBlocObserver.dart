
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver{

  @override
  void onEvent(Bloc bloc, Object event) {
    print('onEvent $event');
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('onError $error');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('onTransition $transition');
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print('onTransition $change');
  }
}