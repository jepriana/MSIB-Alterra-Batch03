import 'package:flutter/material.dart';
import 'package:flutter_shop_cart/models/product.dart';
import 'package:intl/intl.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  ProductDetailPage(this.product, {super.key});
  final currency = NumberFormat("#,##0.00", "id_ID");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: product.id,
            child: product.image != null
                ? Image.network(
                    product.image!,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/default.jpg',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
          Text(
            product.name,
            style: const TextStyle(fontSize: 20),
          ),
          Text('Rp ${currency.format(product.price)}'),
        ],
      ),
    );
  }
}
