import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData.raw(
        Brightness.dark,
        null,
        null,
        null,
        null,
        null,
      ),
      home: HomePage(),
    );
  }
}
