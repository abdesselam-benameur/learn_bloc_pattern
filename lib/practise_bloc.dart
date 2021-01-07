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
  final subscription = bloc.listen(print); // 1

  // Note: await Future.delayed(Duration.zero) is added for this example to avoid
  // canceling the subscription immediately.
  await Future.delayed(Duration.zero);

  await subscription.cancel();
  await bloc.close();
}
