import 'package:flutter/material.dart';
import 'package:flutter_shop_cart/data/products.dart';
import 'package:flutter_shop_cart/models/product.dart';
import 'package:flutter_shop_cart/widgets/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    super.key,
    required this.cartList,
  });
  final List<Product> cartList;

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
          return ProductCard(
            product: productList[index],
            isAdded: widget.cartList.contains(productList[index]),
            onTap: () {
              setState(() {
                widget.cartList.add(productList[index]);
              });
            },
          );
        },
        itemCount: productList.length,
      ),
    );
  }
}
