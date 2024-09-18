import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';

class AllOrdersScreen extends StatelessWidget {
  final List<Product> orderItems; // List of products in the order

  const AllOrdersScreen({super.key, required this.orderItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Orders".tr(),
            style: getBoldBlack14Style()), // Localization for "All Orders"
      ),
      body: ListView.builder(
        itemCount: orderItems.length,
        itemBuilder: (context, index) {
          final product = orderItems[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            child: ListTile(
              leading: product.images!.isNotEmpty
                  ? Image.network(
                      product.images?[0] ??
                          "", // Show product image (first image)
                      width: 50.w,
                      height: 50.h,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.image_not_supported),
              title: Text(
                product.productName ?? 'No name',
                style: getBoldBlack14Style()
                    .copyWith(color: MyTheme.mainPrimaryColor4),
              ),
              subtitle: Row(
                children: [
                  Text("SAR".tr(), style: getBoldBlack14Style()),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    product.price != null
                        ? '${product.price}'
                        : 'No price'.tr(),
                    style: getBoldBlack14Style(),
                  ),
                ],
              ),
              trailing: Text(
                product.category ?? '', // Show product category
                style: getBoldBlack14Style(),
              ),
            ),
          );
        },
      ),
    );
  }
}
