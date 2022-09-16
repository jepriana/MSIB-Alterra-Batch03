import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  const BoldText({
    Key? key,
    required int counter,
  })  : _counter = counter,
        super(key: key);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Text(
      _counter.toString(),
      style: const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
