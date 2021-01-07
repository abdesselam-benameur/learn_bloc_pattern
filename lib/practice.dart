import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  // Note: A Change occurs just before the state of the Cubit is updated.
  // A Change consists of the currentState and the nextState.
  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }
}

void main() {
  CounterCubit()
    ..increment()
    ..close();
}
