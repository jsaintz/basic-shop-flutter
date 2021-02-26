import 'dart:math';

import 'package:basic_shop_flutter/models/cart.dart';
import 'package:basic_shop_flutter/models/order.dart';
import 'package:flutter/cupertino.dart';

class OrdersProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> products, double total) {
    final total = products.fold(0.0, (t, i) => t + (i.price * i.quantity));
    _orders.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: total,
        date: DateTime.now(),
        products: products,
      ),
    );
    notifyListeners();
  }
}
