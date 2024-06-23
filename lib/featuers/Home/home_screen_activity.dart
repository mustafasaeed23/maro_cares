import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/side_menu/show_drawer.dart';
import 'package:maro/presentation/screens/products_categories.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/presentation/widgets/appbar_widget_icons.dart';
import 'package:maro/presentation/widgets/banners_widget.dart';
import 'package:maro/presentation/widgets/categories_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:maro/presentation/widgets/products.dart';
import 'package:maro/presentation/widgets/shopping_ads.dart';
import 'package:maro/presentation/widgets/trending_products.dart';

class HomeScreenActivity extends StatelessWidget {
  const HomeScreenActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                        child: Text(
                          "ع",
                          style: TextStyle(
                            backgroundColor: Colors.transparent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: MyTheme.mainPrimaryColor4
                          )
                        ),
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
      body: Stack(
        children:
            [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),

                Center(
                  child: Container(
                    width: 347.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 25,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            "Search".tr(),
                            style: getBoldBlack12Style(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                // Image.asset("assets/images/banner1.jpg",
                // width: 398.w,
                // height: 150.h,
                // fit: BoxFit.fill,
                // ),
                const BannersWidget(),
                SizedBox(
                  height: 20.h,
                ),

                // const BannersWidget(),
                const CategoriesWidget(),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  children: [
                    Text("Best Brands for you".tr(),
                        style: getBoldBlack14Style()),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed(ProductsCategories.routeName),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "See all".tr(),
                            style: getSemiBoldBlack10Style(),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Icon(Icons.arrow_forward)
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                const Products(),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                const BannersWidget(),
                SizedBox(
                  height: 50.h,
                ),
                Text("Trending".tr(), style: getBoldBlack16Style()),
                SizedBox(
                  height: 30.h,
                ),
                TrendingWidget(),
                SizedBox(
                  height: 40.h,
                ),
                const ShoppingAds(),
                SizedBox(
                  height: 30.h,
                ),
                Text("For Sale".tr(), style: getBoldBlack16Style()),
                SizedBox(
                  height: 40.h,
                ),
                TrendingWidget(),
                SizedBox(
                  height: 40.h,
                ),
                Text("Our Choise".tr(), style: getBoldBlack16Style()),
                SizedBox(
                  height: 30.h,
                ),
                TrendingWidget(),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
        ),
    ],
      ),
    );
  }
}
