import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Stream<int> counterStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Streams"),
        ),
        body: Center(
          child: StreamBuilder(
            stream: counterStream(),
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
          onPressed: (() {}),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
