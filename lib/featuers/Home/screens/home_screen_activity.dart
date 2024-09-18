import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/core/widgets/custom_appbar.dart';
import 'package:maro/core/widgets/search_widget.dart';
import 'package:maro/featuers/Home/Products/screens/on_sale_products.dart';
import 'package:maro/featuers/Home/Products/screens/our_choose_products.dart';
import 'package:maro/featuers/Home/Products/screens/trending_products.dart';
import 'package:maro/featuers/Home/Sliders/ads_slider.dart';
import 'package:maro/featuers/Home/Sliders/banners_widget.dart';
import 'package:maro/featuers/Home/brands/screens/brands_grid_screen.dart';
import 'package:maro/core/widgets/categories_widget.dart';
import 'package:maro/core/widgets/products.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreenActivity extends StatelessWidget {
  HomeScreenActivity({super.key});
  final LanguageManagerAPi languageManager = LanguageManagerAPi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: "",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              SearchWidget(),
              SizedBox(
                height: 30.h,
              ),
              BannersWidgetAds(),
              SizedBox(
                height: 35.h,
              ),
              const Categories(),
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
                        .pushNamed(BrandsGridScreen.routeName),
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
              BannersWidgetAds(),
              SizedBox(
                height: 50.h,
              ),
              Text("Trending".tr(), style: getBoldBlack16Style()),
              SizedBox(
                height: 30.h,
              ),
              TrendingProducts(),
              SizedBox(
                height: 40.h,
              ),
              AdsSlider(),
              SizedBox(
                height: 30.h,
              ),
              Text("For Sale".tr(), style: getBoldBlack16Style()),
              SizedBox(
                height: 40.h,
              ),
              OnSaleProducts(),
              SizedBox(
                height: 40.h,
              ),
              AdsSlider(),
              SizedBox(
                height: 40.h,
              ),
              Text("Our Choise".tr(), style: getBoldBlack16Style()),
              SizedBox(
                height: 30.h,
              ),
              OurSelectionProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
