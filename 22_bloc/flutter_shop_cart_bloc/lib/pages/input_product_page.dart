import 'package:flutter/material.dart';

class InputProductPage extends StatelessWidget {
  static const routeName = '/product/entry';
  const InputProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entry Product'),
      ),
    );
  }
}
