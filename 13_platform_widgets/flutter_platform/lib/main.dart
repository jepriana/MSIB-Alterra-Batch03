import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            theme: const CupertinoThemeData.raw(
                Brightness.dark, null, null, null, null, null),
            home: HomePage(),
          )
        : MaterialApp(
            title: 'Flutter Platform',
            theme: ThemeData.dark(),
            home: HomePage(),
          );
  }
}
