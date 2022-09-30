import 'package:flutter/material.dart';

class ProfileSheet extends StatelessWidget {
  const ProfileSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Container(
            height: 128,
            width: 128,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'I Wayan Jepriana',
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
