import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
}

Future<void> main() async {
  final cubit = CounterCubit();
  final subscription = cubit.listen(print); // 1
  cubit.increment();
  // Note: await Future.delayed(Duration.zero) is added for this example
  // to avoid canceling the subscription immediately.
  await Future.delayed(Duration.zero);
  await subscription.cancel();
  await cubit.close();
}
