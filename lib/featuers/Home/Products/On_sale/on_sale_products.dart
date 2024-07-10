import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Home/widgets/products_details.dart';
import 'package:maro/featuers/presentation/widgets/Heart_Icon_Button.dart';

class OnSaleProductCarsouelScreen extends StatefulWidget {
  const OnSaleProductCarsouelScreen({super.key});

  @override
  _TrendingProductCarouselScreenState createState() => _TrendingProductCarouselScreenState();
}

class _TrendingProductCarouselScreenState extends State<OnSaleProductCarsouelScreen> {
  String selectedLanguage = 'ar';

  Future<List<dynamic>> fetchProducts() async {
    var headers = {'language': 'ar'};
    var dio = Dio();

    try {
      var response = await dio.request(
        'https://maro-cares-z86j.onrender.com/product/getProductBySectionType/Trending',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        if (data is Map<String, dynamic> && data.containsKey('products')) {
          return data['products'] as List;
        } else {
          throw Exception('Unexpected response structure: ${response.data}');
        }
      } else {
        throw Exception('Failed to load products: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchProducts(),
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
              height: 480,
              enlargeCenterPage: true,
              autoPlay: false,
              reverse: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: products.map((product) {
              var imageUrl = product['images'] != null && product['images'].isNotEmpty
                  ? product['images'][0]
                  : 'https://via.placeholder.com/150';
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductsDetails(product: product),
                    ),
                  );
                },
                child: Card(
                  borderOnForeground: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: HeartIcon(),
                      ),
                      SizedBox(height: 10.h),
                      Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        height: 150,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            Text(
                              product['productName'] ?? 'No name',
                              style: getMediumBlue16Style(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Text(
                                  product['category'] ?? 'No category',
                                  style: getMediumBlack12Style().copyWith(
                                    color: MyTheme.mainPrimaryColor4,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Spacer(),
                                Text(
                                  product['price'] != null
                                      ? 'SAR ${product['price']}'
                                      : 'No price'.tr(),
                                  style: getBoldBlack14Style().copyWith(
                                    color: const Color.fromARGB(255, 7, 99, 10),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product['description'] ?? 'No description',
                              style: getMediumBlack14Style(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                            SizedBox(height: 14.h),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.shopping_cart,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    "Add to Cart".tr(),
                                    style: getMediumWhite14Style(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
