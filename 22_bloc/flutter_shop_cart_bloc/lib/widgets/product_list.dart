import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_cart/bloc/cart/cart_bloc.dart';
import 'package:flutter_shop_cart/data/products.dart';
import 'package:flutter_shop_cart/widgets/product_card.dart';

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
          return BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return ProductCard(
                product: productList[index],
                isAdded: state.items.contains(productList[index]),
                onTap: () {
                  context.read<CartBloc>().add(
                        AddProduct(
                          productList[index],
                        ),
                      );
                },
              );
            },
          );
        },
        itemCount: productList.length,
      ),
    );
  }
}
