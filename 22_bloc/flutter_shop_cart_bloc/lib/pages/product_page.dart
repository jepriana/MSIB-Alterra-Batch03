import 'package:flutter/material.dart';
import 'package:flutter_shop_cart/pages/cart_page.dart';
import 'package:flutter_shop_cart/pages/input_product_page.dart';
import 'package:flutter_shop_cart/widgets/product_list.dart';

class ProductPage extends StatefulWidget {
  static const routeName = '/product';
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alta Shop'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart_rounded,
            ),
          ),
        ],
      ),
      body: const ProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(InputProductPage.routeName),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
