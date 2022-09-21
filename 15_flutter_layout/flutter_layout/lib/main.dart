import 'package:flutter/material.dart';
import 'package:flutter_layout/col_row.dart';
import 'package:flutter_layout/grid_display.dart';
import 'package:flutter_layout/list_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('FLutter Layout'),
            bottom: const TabBar(
              tabs: [
                Text('Col/Row'),
                Text('List'),
                Text('Grid'),
              ],
            ),
          ),
          body: TabBarView(children: [
            ColRow(),
            ListDisplay(),
            GridDisplay(),
          ]),
        ),
      ),
    );
  }
}
