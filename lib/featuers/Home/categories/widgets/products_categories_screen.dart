import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/color_manager.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/core/widgets/custom_appbar.dart';
import 'package:maro/core/widgets/heart_icon.dart';
import 'package:maro/core/widgets/options_bottom_sheet.dart';
import 'package:maro/featuers/Cart/bloc/cart_bloc.dart';
import 'package:maro/featuers/Cart/bloc/cart_event.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';
import 'package:maro/featuers/Home/Products/screens/products_details.dart';
import '../../../../core/theme/my_theme.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../side_menu/Data/api_manger.dart';

class ProductCategoriesScreen extends StatefulWidget {
  final String category;
  final ApiManager apiManager;

  ProductCategoriesScreen({required this.category, required this.apiManager});

  @override
  _ProductCategoriesScreenState createState() =>
      _ProductCategoriesScreenState();
}

class _ProductCategoriesScreenState extends State<ProductCategoriesScreen> {
  List<String> _selectedFilters = [];
  final LanguageManagerAPi languageManager = LanguageManagerAPi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "",
      ),
      body: FutureBuilder<List<Product>>(
        future:
            widget.apiManager.getProductsByCategory(widget.category, 1, "ar"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'No Data',
                style: getBoldBlue14Style(),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No products found',
                style: getBoldBlue14Style(),
              ),
            );
          } else {
            var products = snapshot.data!;
            var filteredProducts = _selectedFilters.isNotEmpty
                ? products.where((product) {
                    return product.filter!
                        .any((filter) => _selectedFilters.contains(filter));
                  }).toList()
                : products;

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.category.tr(),
                            style: getSemiBoldBlack14Style(),
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            "اكتشف مجموعتنا الواسعه من ${widget.category}".tr(),
                            style: getSemiBold8Style(),
                          ),
                        ],
                      ),
                      SizedBox(width: 40.w),
                      InkWell(
                        onTap: () {
                          if (products.isNotEmpty) {
                            showOptionsBottomSheet(context, products[0]);
                          }
                        },
                        child: Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: MyTheme.greyColor,
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          child: Icon(
                            Icons.filter_alt_sharp,
                            size: 30,
                            color: MyTheme.mainPrimaryColor4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  ListView.builder(
                    padding: EdgeInsets.all(15),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      var product = filteredProducts[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
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
                            child: Container(
                              width: 330.w,
                              height: 250.h,
                              decoration: BoxDecoration(
                                color: MyTheme.mainColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.r)),
                                boxShadow: [
                                  BoxShadow(
                                    color: MyTheme.greyColor,
                                    blurStyle: BlurStyle.outer,
                                    offset: const Offset(0, 0),
                                    blurRadius: 7,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      HeartIcon(product: product),
                                      SizedBox(height: 10.h),
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          product.productName ?? 'No name',
                                          style: getRegularBlack14Style(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textWidthBasis:
                                              TextWidthBasis.longestLine,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        product.category ?? 'No category',
                                        style: getMediumBlue14Style(),
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        children: [
                                          Text("SAR".tr(),
                                              style: getBoldBlack14Style()
                                                  .copyWith(
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
                                            style:
                                                getBoldBlack14Style().copyWith(
                                              color: const Color.fromARGB(
                                                  255, 7, 99, 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              MyTheme.mainPrimaryColor4,
                                        ),
                                        onPressed: () {
                                          context
                                              .read<CartBloc>()
                                              .add(AddProductToCart(product));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Row(
                                                  children: [
                                                    Text(product.category ?? "",
                                                        style:
                                                            getMediumWhite14Style()),
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                    Text(
                                                      "added to cart".tr(),
                                                      style:
                                                          getMediumWhite14Style(),
                                                    ),
                                                  ],
                                                ),
                                                backgroundColor:
                                                    ColorManager.greenColor),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.shopping_cart,
                                              color: MyTheme.mainColor,
                                              size: 20,
                                            ),
                                            SizedBox(width: 10.w),
                                            Text(
                                              "Add to Cart".tr(),
                                              style: getRegularWhite14Style(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.network(
                                    product.images != null &&
                                            product.images!.isNotEmpty
                                        ? product.images![0]
                                        : "",
                                    height: 288.h,
                                    width: 150.w,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  void showOptionsBottomSheet(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      builder: (context) => OptionsBottomSheet(
        product: product,
        selectedFilters: _selectedFilters,
        onFiltersSelected: (filters) {
          setState(() {
            _selectedFilters = filters;
          });
        },
      ),
    );
  }
}
