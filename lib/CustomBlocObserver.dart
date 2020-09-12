import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('onEvent $event');
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    super.onError(cubit, error, stackTrace);
    print('onError $error');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition $transition');
  }

  @override
  void onChange(Cubit cubit, Change change) {
    // when cubit is a bloc then we don't want to print the change because onTransition will already print it.
    if (cubit is Bloc) {
      return;
    }
    super.onChange(cubit, change);
    print('onTransition $change');
  }
}
