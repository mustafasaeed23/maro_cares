import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Home/Products/screens/products_details.dart';

class ProductPriceWidget extends StatelessWidget {
  const ProductPriceWidget({
    super.key,
    required this.widget,
  });

  final ProductsDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("SAR".tr(),
            style: getBoldBlack14Style().copyWith(
              color: const Color.fromARGB(255, 7, 99, 10),
            )),
        SizedBox(
          width: 2.w,
        ),
        Text(
          widget.product.price != null
              ? "${widget.product.price} "
              : 'No price'.tr(),
          style: getBoldBlack14Style().copyWith(
            color: const Color.fromARGB(255, 7, 99, 10),
          ),
        ),
      ],
    );
  }
}
