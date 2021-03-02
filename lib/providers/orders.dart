import 'dart:math';

import 'package:basic_shop_flutter/models/order.dart';
import 'package:basic_shop_flutter/providers/cart.dart';
import 'package:flutter/cupertino.dart';

class OrdersProvider with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(CartProvider cart) {
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        date: DateTime.now(),
        products: cart.items.values.toList(),
      ),
    );
    notifyListeners();
  }
}
