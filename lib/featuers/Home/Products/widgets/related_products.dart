import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Home/Products/Data/product_details_model.dart';

class RelatedProductsCarousel extends StatelessWidget {
  final List<RelatedProducts>? relatedProducts;

  const RelatedProductsCarousel({super.key, this.relatedProducts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          "Related Products".tr(),
          style: getBoldBlue14Style(),
        ),
        SizedBox(height: 10.h),
        CarouselSlider(
          options: CarouselOptions(
            height: 250.h,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval:const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            scrollDirection: Axis.horizontal,
          ),
          items: relatedProducts?.map<Widget>((relatedProduct) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0.r)),
                        child: Image.network(
                          relatedProduct.images?.isNotEmpty == true
                              ? relatedProduct.images![0]
                              : 'https://via.placeholder.com/150',
                          fit: BoxFit.cover,
                          height: 150.h,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              relatedProduct.productName ?? 'No name',
                              style: getMediumBlack14Style(),
                              maxLines: 1,
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              relatedProduct.price != null
                                  ? "${relatedProduct.price} SAR"
                                  : 'No price',
                              style: getMediumBlack12Style(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList() ?? [],
        ),
      ],
    );
  }
}
