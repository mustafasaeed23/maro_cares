import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/core/widgets/home_screen_brands.dart';
import '../theme/styles_manager.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  // A method to handle the navigation to HomeBrandsScreen
  void _navigateToHomeBrands(BuildContext context, String brand) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeBrandsScreen(brand: brand),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> brands = [
      {'name': "Bioderma".tr(), 'image': 'assets/images/biooderma.png'},
      {'name': "Fresh me".tr(), 'image': 'assets/images/somebymi.png'},
      {'name': "Beauty Star".tr(), 'image': 'assets/images/beautyofjoseon.png'},
      {'name': "I'm sorry".tr(), 'image': 'assets/images/ImsorryformySkin.png'},
      {'name': "Ordinary".tr(), 'image': 'assets/images/theOrdinary.png'},
      {'name': "Qv".tr(), 'image': 'assets/images/qv.png'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: brands.map((brand) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GestureDetector(
              onTap: () => _navigateToHomeBrands(context, brand['name']!),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 50.r,
                    child: Image.asset(brand['image']!),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    brand['name']!,
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
