import 'package:flutter/material.dart';
import 'package:flutter_shop_cart/models/product.dart';
import 'package:intl/intl.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key, required this.cartList});
  final List<Product> cartList;
  final currency = NumberFormat("#,##0.00", "id_ID");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cartList[index].name),
                    subtitle:
                        Text('Rp ${currency.format(cartList[index].price)}'),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: cartList.length,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
              ),
              child: const Text('Buy'),
            )
          ],
        ),
      ),
    );
  }
}
