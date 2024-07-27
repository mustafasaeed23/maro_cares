// widgets/cart_item.dart

import 'package:flutter/material.dart';
import '../../Home/Products/Data/model.dart';

class CartItem extends StatelessWidget {
  final Product product;

  const CartItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  product.images != null && product.images!.isNotEmpty
                      ? product.images![0]
                      : 'https://via.placeholder.com/150'),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName ?? "",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '\$${product.price?.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
