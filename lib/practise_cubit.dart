import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  // Note: A Change occurs just before the state of the Cubit is updated.
  // A Change consists of the currentState and the nextState.
  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }

  // Note: onError can be overridden within the Cubit to handle all errors for a specific Cubit.
  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}

class SimpleBlocObserver extends BlocObserver {
  // One added bonus of using the bloc library is that we can have access to all Changes in one place.
  // Even though in this application we only have one Cubit, it's fairly common in larger applications
  // to have many Cubits managing different parts of the application's state.

  // Note: The internal onChange override is called first, followed by onChange in BlocObserver.
  // Tip: In BlocObserver we have access to the Cubit instance in addition to the Change itself.
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }

  // onError can also be overridden in BlocObserver to handle all reported errors globally.
  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('${cubit.runtimeType} $error $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  // Note: All we need to do is extend BlocObserver and override the onChange method.
  Bloc.observer = SimpleBlocObserver();
  CounterCubit()
    ..increment()
    ..close();
}
