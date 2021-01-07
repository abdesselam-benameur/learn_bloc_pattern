import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    // Tip: async* means the function is an async generator which is capable of
    // emitting states via the yield keyword.
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }

  // Note: onTransition is invoked first (local before global) followed by onChange.
  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    print(transition);
    super.onTransition(transition);
  }

  // Note: onEvent is called as soon as the event is added.
  // The local onEvent is invoked before the global onEvent in BlocObserver.
  @override
  void onEvent(CounterEvent event) {
    print(event);
    super.onEvent(event);
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    print('${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('${cubit.runtimeType} $error $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  CounterBloc()
    ..add(CounterEvent.increment)
    ..close();
}
