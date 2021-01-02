import 'dart:async';

import 'package:learn_bloc_pattern/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  /// For events, exposing only a sink which is an input
  Sink<CounterEvent> get counterEventSink => _counterEventSinkController.sink;
  final _counterEventSinkController = StreamController<CounterEvent>();

  /// For state, exposing only a stream which outputs data
  Stream<int> get coutner => _counterStateStreamController.stream;
  final _counterStateStreamController = StreamController<int>();

  //StreamSink<int> get _inCounter => _counterStateStreamController.sink;

  CounterBloc() {
    _counterEventSinkController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent)
      _counter++;
    else
      _counter--;

    _counterStateStreamController.sink.add(_counter);
  }

  void dispose() {
    _counterEventSinkController.close();
    _counterStateStreamController.close();
  }
}
