import 'package:bloc/bloc.dart';
import 'package:learn_bloc_pattern/counter_event.dart';
import 'package:learn_bloc_pattern/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(CounterState initialState) : super(initialState);

  void onIncrement() {
    add(IncrementEvent());
  }

  void onDecrement() {
    add(DecrementEvent());
  }

  // @override
  // CounterState get initialState => CounterState.initial();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    final _currentState = state;
    if (event is IncrementEvent) {
      yield CounterState(counter: _currentState.counter + 1);
    } else if (event is DecrementEvent) {
      yield CounterState(counter: _currentState.counter - 1);
    }
  }
}
