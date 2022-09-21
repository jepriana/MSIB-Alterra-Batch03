import 'package:flutter/material.dart';
import 'package:flutter_layout/box.dart';

class GridDisplay extends StatelessWidget {
  GridDisplay({super.key});

  final boxColors = [
    Colors.amber,
    Colors.green,
    Colors.purple,
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.black,
    Colors.grey,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) => Box(boxColors[index]),
      itemCount: boxColors.length,
    );
  }
}
