import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/featuers/Home/categories/widgets/products_categories_screen.dart';
import 'package:maro/featuers/side_menu/Data/api_manger.dart';
import '../theme/styles_manager.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  // A method to handle the navigation to HomeCategoriesScreen
  void _navigateToHomeCategories(
      BuildContext context, String category, ApiManager apiManager) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductCategoriesScreen(
          category: category.tr(),
          apiManager: apiManager,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'name': "Skincare".tr(), 'image': 'assets/images/skincare.png'},
      {'name': "Makeup".tr(), 'image': 'assets/images/skincare.png'},
      {'name': "Haircare".tr(), 'image': 'assets/images/skincare.png'},
      {'name': "Fragrance".tr(), 'image': 'assets/images/skincare.png'},
      {'name': "Bodycare".tr(), 'image': 'assets/images/skincare.png'},
      {'name': "Tools".tr(), 'image': 'assets/images/skincare.png'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: GestureDetector(
              onTap: () => _navigateToHomeCategories(
                  context, category['name']!, ApiManager()),
              child: Column(
                children: [
                  Container(
                    width: 100.w,
                    height: 100.w,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        category['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    category['name']!,
                    style: getBoldBlue14Style(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
