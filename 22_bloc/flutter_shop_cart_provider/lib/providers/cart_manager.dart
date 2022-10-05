import 'package:flutter/foundation.dart';
import 'package:flutter_shop_cart/models/product.dart';

class CartManager with ChangeNotifier {
  final List<Product> _cartList = [];

  List<Product> get cartList => [..._cartList];

  void addProduct(Product product) {
    print(product);
    _cartList.add(product);
    notifyListeners();
  }
}
