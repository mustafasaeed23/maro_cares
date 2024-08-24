// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/core/widgets/card_widget.dart';
import 'package:maro/featuers/Home/Products/Data/api_manager_product.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';
import 'package:maro/featuers/Home/Products/screens/products_details.dart';

class OurSelectionProducts extends StatefulWidget {
  OurSelectionProducts({Key? key}) : super(key: key);
  final ApiManagerProducts _apiManagerProducts = ApiManagerProducts();

  @override
  _OurSelectionProductsState createState() => _OurSelectionProductsState();
}

class _OurSelectionProductsState extends State<OurSelectionProducts> {
    final LanguageManagerAPi languageManager = LanguageManagerAPi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: ApiManagerProducts().getOurSelectionProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${snapshot.error}'),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('Retry').tr(),
                ),
              ],
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No products found.'));
        } else {
          var products = snapshot.data!;
          return CarouselSlider(
            options: CarouselOptions(
              height: 548,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: products.map((product) {
              var imageUrl =
                  product.images != null && product.images!.isNotEmpty
                      ? product.images![0]
                      : '';
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductsDetailsScreen(product: product, languageManager: languageManager,),
                    ),
                  );
                },
                child: CardWidget(imageUrl: imageUrl, product: product),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
