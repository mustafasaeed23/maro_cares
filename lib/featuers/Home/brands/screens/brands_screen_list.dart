// ignore_for_file: dead_code, unused_local_variable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/color_manager.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/featuers/Cart/bloc/cart_bloc.dart';
import 'package:maro/featuers/Cart/bloc/cart_event.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';
import 'package:maro/featuers/Home/Products/screens/products_details.dart';
import 'package:maro/featuers/Home/brands/Data/brands_api_manager.dart';

class BrandsScreenList extends StatefulWidget {
  final String brandName;

  const BrandsScreenList({super.key, required this.brandName});

  static const String routeName = 'brands_list';

  @override
  // ignore: library_private_types_in_public_api
  _BrandsScreenListState createState() => _BrandsScreenListState();
}

class _BrandsScreenListState extends State<BrandsScreenList> {
  ApiManagerBrands apiManager = ApiManagerBrands();
  final LanguageManagerAPi languageManager = LanguageManagerAPi();
  List<Product> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    setState(() {
      isLoading = true;
    });

    try {
      List<Product> data =
          await apiManager.getProductByBrand(widget.brandName, 1);
      setState(() {
        products = data;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching products: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.brandName.tr()}",
          style: getBoldBlack16Style(),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : products.isEmpty
              ? Center(
                  child: Text(
                    'No products found',
                    style: getBoldBlue14Style(),
                  ),
                )
              : GridView.builder(
                  padding: EdgeInsets.all(12.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 0.80,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    var product = products[index];
                    var imageUrl = product.images?[0] ?? "";
                    String? brandName = product.brand;

                    return Card(
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      ProductsDetailsScreen(product: product, languageManager: languageManager,),
                                ),
                              );
                            },
                            child: AspectRatio(
                              aspectRatio: 1.5,
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 70.w,
                                  child: Text(
                                    product.category ?? "",
                                    style: getBoldBlack10Style().copyWith(
                                        color: MyTheme.mainPrimaryColor4),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Text("SAR".tr(),
                                        style: getBoldBlack12Style().copyWith(
                                          color: const Color.fromARGB(
                                              255, 7, 99, 10),
                                        )),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      product.price != null
                                          ? "${product.price} "
                                          : 'No price'.tr(),
                                      style: getBoldBlack12Style().copyWith(
                                        color: const Color.fromARGB(
                                            255, 7, 99, 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 5.0, left: 5.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: MyTheme.mainPrimaryColor4),
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(AddProductToCart(product));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Row(
                                          children: [
                                            Text(product.category ?? "",
                                                style: getMediumWhite14Style()),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text(
                                              "added to cart".tr(),
                                              style: getMediumWhite14Style(),
                                            ),
                                          ],
                                        ),
                                        backgroundColor:
                                            ColorManager.greenColor),
                                  );
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      "Add to Cart".tr(),
                                      style: getRegularWhite12Style(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
