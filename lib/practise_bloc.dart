import 'package:flutter_bloc/flutter_bloc.dart';

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
}

Future<void> main() async {
  final bloc = CounterBloc();
  print(bloc.state); // 0
  bloc.add(CounterEvent.increment);

  // Note: await Future.delayed(Duration.zero) is added to ensure we wait for
  // the next event-loop iteration (allowing mapEventToState to process the increment event).
  await Future.delayed(Duration.zero);

  print(bloc.state); // 1
  await bloc.close();
}
