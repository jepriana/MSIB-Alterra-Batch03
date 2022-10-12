import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int status = -1;
  String values = '';

  void getDataContacts() async {
    Dio dio = Dio();
    final response = await dio.get('https://api.jepriana.com/contacts');

    if (response.data != null) {
      setState(() {
        status = response.data['status'];
        values = jsonEncode(response.data['values']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: getDataContacts,
              child: const Text('Get Data Contact'),
            ),
            Text(
              'Status: $status',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Values: $values'),
          ],
        ),
      ),
    );
  }
}
