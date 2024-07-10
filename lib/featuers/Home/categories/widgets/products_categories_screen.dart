import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/featuers/presentation/widgets/Heart_Icon_Button.dart';

import '../../../../core/Utills/utills.dart';
import '../../../../core/theme/my_theme.dart';
import '../../../../core/theme/styles_manager.dart';
import '../../../../core/translation.dart';
import '../../../presentation/widgets/appbar_widget_icons.dart';
import '../../../side_menu/Data/api_manger.dart';
import '../../../side_menu/show_drawer.dart';

class ProductCategoriesScreen extends StatelessWidget {
  final String category;
  final ApiManager apiManager;

  ProductCategoriesScreen({required this.category, required this.apiManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 10,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0),
            child: Image.asset(
              "assets/images/logo2.png",
              fit: BoxFit.fill,
              width: 70.h,
              height: 50.h,
            ),
          ),
        ],
        leadingWidth: 160.w,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ShowDrawer(),
              SizedBox(
                width: 8.w,
              ),
              AppBarWidgetIcon(
                  iconButton: IconButton(
                      onPressed: () {
                        LocalizationChecker.changeLangauge(context);
                      },
                      icon: Center(
                        child: Text("ع",
                            style: TextStyle(
                                backgroundColor: Colors.transparent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: MyTheme.mainPrimaryColor4)),
                      ))),
              SizedBox(
                width: 8.w,
              ),
              AppBarWidgetIcon(
                  iconButton: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.light_mode),
                color: MyTheme.mainPrimaryColor4.withOpacity(0.9),
              )),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: apiManager.getProductsByCategory(category, 1, 'ar'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('No Data',
            style: getBoldBlue14Style(),
            ));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products found,',
            style: getBoldBlue14Style(),
            ));
          } else {
            var products = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            category.tr(),
                            style: getSemiBoldBlack14Style(),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "اكتشف مجموعتنا الواسعه من $category".tr(),
                            style: getSemiBold8Style(),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      InkWell(
                        onTap: () {
                          showOptions(context);
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
                  SizedBox(
                    height: 40.h,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(15),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      var product = products[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 330.w,
                            height: 292.h,
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
                                    spreadRadius: 5),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HeartIcon(),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        product['productName'],
                                        style: getRegularBlack14Style(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textWidthBasis:
                                            TextWidthBasis.longestLine,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      product['category'],
                                      style: getBoldBlue14Style(),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      width: 150.w,
                                      child: Text(
                                        product['description'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: getRegularBlack10Style(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      product['price'] != null
                                          ? '\SAR ${product['price']}'
                                          : 'No price'.tr(),
                                      style: getBoldBlack14Style().copyWith(
                                        color: const Color.fromARGB(
                                            255, 7, 99, 10),
                                      ),
                                    ),
                                    SizedBox(height: 20.h,),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(backgroundColor: MyTheme.mainPrimaryColor4),
                                        onPressed: (){},
                                        child: Row(
                                          children: [
                                            Icon(Icons.shopping_cart,color: MyTheme.mainColor, size: 20,),
                                            SizedBox(width: 10.w,),
                                            Text("Add to Cart".tr(),
                                            style: getRegularWhite14Style(),
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                                Spacer(),
                                Image.network(product['images'] != null &&
                                    product['images'].isNotEmpty
                                    ? product['images'][0]
                                    : 'https://via.placeholder.com/150',
                                  height: 288.h,
                                  width: 150.w,
                                  fit: BoxFit.cover,
                                ),

                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 20.h,),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
