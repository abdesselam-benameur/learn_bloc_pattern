import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_pattern/counter_event.dart';
import 'counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn BLoC pattern"),
      ),
      body: Container(),
      // body: BlocBuilder<CounterBloc, CounterState>(
      //   cubit: _bloc,
      //   builder: (context, state) {
      //     return Center(
      //       child: StreamBuilder(
      //         stream: _bloc.coutner,
      //         initialData: 0,
      //         builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
      //           return Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: <Widget>[
      //               Text(
      //                 'You have pushed the button this many times:',
      //               ),
      //               Text(
      //                 '${snapshot.data}',
      //                 style: Theme.of(context).textTheme.headline4,
      //               ),
      //             ],
      //           );
      //         },
      //       ),
      //     );
      //   },
      // ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
      //       tooltip: 'Increment',
      //       child: Icon(Icons.add),
      //     ),
      //     SizedBox(width: 10),
      //     FloatingActionButton(
      //       onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
      //       tooltip: 'Decrement',
      //       child: Icon(Icons.remove),
      //     ),
      //   ],
      // ),
    );
  }
}
