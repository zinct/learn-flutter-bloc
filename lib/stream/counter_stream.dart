import 'dart:async';

class CounterStream {
  int counter;
  CounterStream({required this.counter});

  final _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  void increment() {
    _controller.sink.add(counter++);
  }
}
