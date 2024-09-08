import 'package:flutter/material.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';

class AllOrdersScreen extends StatelessWidget {
  final List<Product> orderItems;

  const AllOrdersScreen({super.key, required this.orderItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Orders"),
      ),
      body: ListView.builder(
        itemCount: orderItems.length,
        itemBuilder: (context, index) {
          final product = orderItems[index];
          return ListTile(
            title: Text(product.productName ?? 'Product'),
            subtitle: Text('Price: ${product.price ?? 0}'),
          );
        },
      ),
    );
  }
}
