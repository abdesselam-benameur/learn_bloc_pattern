import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) {
    // TODO: implement mapEventToState
  }
}
