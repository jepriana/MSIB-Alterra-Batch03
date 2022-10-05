import 'package:flutter/material.dart';
import 'package:flutter_shop_cart/pages/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alta Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
        // scaffoldBackgroundColor: Colors.purpleAccent.withOpacity(0.25),
      ),
      home: const ProductPage(),
    );
  }
}
