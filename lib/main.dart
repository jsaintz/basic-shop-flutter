import 'package:basic_shop_flutter/providers/cart.dart';
import 'package:basic_shop_flutter/providers/orders.dart';
import 'package:basic_shop_flutter/providers/products.dart';
import 'package:basic_shop_flutter/utils/app_routes.dart';
import 'package:basic_shop_flutter/views/cart_screen.dart';
import 'package:basic_shop_flutter/views/order_screen.dart';
import 'package:basic_shop_flutter/views/product_detail_screen.dart';
import 'package:basic_shop_flutter/views/product_form_screen.dart';
import 'package:basic_shop_flutter/views/products_overview_screen.dart';
import 'package:basic_shop_flutter/views/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => new CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => new OrdersProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Bob Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        routes: {
          AppRoutes.HOME: (ctx) => ProductOverviewScreen(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
          AppRoutes.CART: (ctx) => CartScreen(),
          AppRoutes.ORDERS: (ctx) => OrdersScreen(),
          AppRoutes.PRODUCTS: (ctx) => ProductsScreen(),
          AppRoutes.PRODUCT_FORM: (ctx) => ProductFormScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bob Store'),
      ),
      body: Center(
        child: Text('Vamos desenvolver uma loja?'),
      ),
    );
  }
}
