import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final String productId;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.productId,
    @required this.quantity,
    @required this.price,
  });
}
