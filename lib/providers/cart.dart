import 'dart:math';

import 'package:basic_shop_flutter/models/cart.dart';
import 'package:basic_shop_flutter/models/product.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items;
  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingItem) => CartItem(
          id: existingItem.id,
          title: existingItem.title,
          quantity: existingItem.quantity,
          price: existingItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          title: product.title,
          quantity: 1,
          price: product.price,
        ),
      );
    }
    notifyListeners();
  }
}
