import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void onCounterButtonPressed(){
    setState(() {_counter = _counter + 1;});
    print('_counter: $_counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello Flutter'),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 60, color: Colors.blue),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onCounterButtonPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}
