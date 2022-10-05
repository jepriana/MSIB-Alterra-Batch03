import 'package:flutter/material.dart';
import 'package:flutter_shop_cart/data/products.dart';
import 'package:flutter_shop_cart/providers/cart_manager.dart';
import 'package:flutter_shop_cart/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    super.key,
  });

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
        ),
        itemBuilder: (context, index) {
          return Consumer<CartManager>(
            builder: (context, manager, child) => ProductCard(
              product: productList[index],
              isAdded: manager.cartList.contains(productList[index]),
              onTap: () {
                manager.addProduct(productList[index]);
              },
            ),
          );
        },
        itemCount: productList.length,
      ),
    );
  }
}
