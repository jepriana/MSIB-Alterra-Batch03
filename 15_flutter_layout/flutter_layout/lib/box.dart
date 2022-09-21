import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final Color boxColor;
  const Box(this.boxColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      margin: const EdgeInsets.all(8),
      color: boxColor,
    );
  }
}
