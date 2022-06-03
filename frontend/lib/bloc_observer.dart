// import 'dart:html';

import 'package:bloc/bloc.dart';


// class SimpleBlocObserver extends BlocObserver {
//   @override
//   void onEvent(Bloc bloc, Object? event) {
//     super.onEvent(bloc, event);
//     print('onEvent $event');
//   }

//   @override
//   onTransition(Bloc bloc, Transition transition) {
//     print('onTransition $transition');
//     super.onTransition(bloc, transition);
//   }

//   // @override
//   // void onError(Cubit cubit, Object error, StackTrace stackTrace) {
//   //   print('onError $error');
//   //   super.onError(cubit, error, stackTrace);
//   // }

//   @override
//   void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
//     // TODO: implement onError
//     print('onError $error');
//     super.onError(bloc, error, stackTrace);
//   }
// }

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('${bloc.runtimeType} $event');
  }

  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase blocBase, Object error, StackTrace stackTrace) {
    super.onError(blocBase, error, stackTrace);
    print('onError $error');
  }
}