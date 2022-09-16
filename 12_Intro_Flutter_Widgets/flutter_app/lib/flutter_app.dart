import 'package:flutter/material.dart';
import './counter.dart';

class FlutterApp extends StatefulWidget {
  const FlutterApp({super.key});

  @override
  State<FlutterApp> createState() => _FlutterAppState();
}

class _FlutterAppState extends State<FlutterApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            child: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Couter(counter: _counter),
    );
  }
}
