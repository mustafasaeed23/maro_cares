import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';
import 'package:maro/featuers/Home/Products/screens/products_details.dart';

class ProductCardHome extends StatelessWidget {
  final Product product;
  final LanguageManagerAPi languageManager = LanguageManagerAPi();

  ProductCardHome({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        elevation: 2,
        margin: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.images![0],
                  width: 100.w,
                  height: 240.h,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 16.w),
              // Product Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      product.productName ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: getBoldBlue12Style(),
                    ),
                    SizedBox(height: 15.h),

                    Row(
                      children: [
                        Text("SAR".tr(),
                            style: getBoldBlack12Style().copyWith(
                              color: const Color.fromARGB(255, 7, 99, 10),
                            )),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          product.price != null
                              ? "${product.price} "
                              : 'No price'.tr(),
                          style: getBoldBlack12Style().copyWith(
                            color: const Color.fromARGB(255, 7, 99, 10),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          product.category ?? "",
                          style: getBoldBlack12Style(),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      product.description ?? "",
                      style: getRegularBlack10Style(),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const Spacer(),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductsDetailsScreen(
                                product: product,
                                languageManager: languageManager,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "More Details".tr(),
                          style: getBoldBlack10Style(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
