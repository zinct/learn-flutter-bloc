import 'package:flutter/material.dart';
import 'package:learn_flutter_bloc/stream/counter_stream.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  CounterStream counterStream = CounterStream(counter: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Streams"),
        ),
        body: Center(
          child: StreamBuilder(
            stream: counterStream.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Text(
                  "Loading...",
                  style: TextStyle(fontSize: 60),
                );

              return Text(
                snapshot.data.toString(),
                style: TextStyle(fontSize: 60),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            counterStream.increment();
          }),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
