import 'package:flutter/material.dart';
import './bold_text.dart';

class Couter extends StatelessWidget {
  const Couter({
    Key? key,
    required int counter,
  })  : _counter = counter,
        super(key: key);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BoldText(counter: _counter),
    );
  }
}
