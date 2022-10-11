import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_cart/bloc/cart/cart_bloc.dart';
import 'package:flutter_shop_cart/pages/cart_page.dart';
import 'package:flutter_shop_cart/pages/input_product_page.dart';
import 'package:flutter_shop_cart/pages/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      child: MaterialApp(
        title: 'Alta Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          useMaterial3: true,
          // scaffoldBackgroundColor: Colors.purpleAccent.withOpacity(0.25),
        ),
        initialRoute: ProductPage.routeName,
        routes: {
          ProductPage.routeName: (context) => const ProductPage(),
          CartPage.routeName: (context) => CartPage(),
          InputProductPage.routeName: (context) => const InputProductPage(),
        },
      ),
    );
  }
}
