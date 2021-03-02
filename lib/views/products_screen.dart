import 'package:basic_shop_flutter/providers/products.dart';
import 'package:basic_shop_flutter/utils/app_routes.dart';
import 'package:basic_shop_flutter/widgets/app_drawer.dart';
import 'package:basic_shop_flutter/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products = productsData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.itemCount,
          itemBuilder: (ctx, index) => Column(
            children: [
              ProductItem(products[index]),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
