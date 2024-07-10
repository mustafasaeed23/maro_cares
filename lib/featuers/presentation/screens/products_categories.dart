import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/presentation/widgets/product_container.dart';

// ignore: use_key_in_widget_constructors
class ProductsCategories extends StatelessWidget {
  static const String routeName = 'products_Categories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProductContainer(
                  imagePath: "assets/images/biooderma.png",
                  title: 'Bioderma',
                ),
                SizedBox(
                  width: 40.w,
                ),
                ProductContainer(
                  imagePath: "assets/images/cetaphil.png",
                  title: 'CetaPhil',
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProductContainer(
                  imagePath: "assets/images/somebymi.png",
                  title: 'Some By MI',
                ),
                SizedBox(
                  width: 40.w,
                ),
                ProductContainer(
                  imagePath: "assets/images/advancedclinicals.png",
                  title: 'Advanced Clinicals',
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProductContainer(
                  imagePath: "assets/images/beautyofjoseon.png",
                  title: 'Beauty Of Joseon',
                ),
                SizedBox(
                  width: 40.w,
                ),
                ProductContainer(
                  imagePath: "assets/images/ImsorryformySkin.png",
                  title: 'Im Sorry for My Skin',
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProductContainer(
                  imagePath: "assets/images/theOrdinary.png",
                  title: 'The Ordinary',
                ),
                SizedBox(
                  width: 40.w,
                ),
                ProductContainer(
                  imagePath: "assets/images/Mielle.png",
                  title: 'Mielle',
                ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              width: 140.w,
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey,
                      blurStyle: BlurStyle.outer,
                      offset: Offset(0, 4),
                      spreadRadius: 10),
                ],
              ),
              child: Column(children: [
                Image.asset("assets/images/qv.png"),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "QV",
                  style: getRegularBlack12Style(),
                )
              ]),
            ),
            SizedBox(
              height: 60.h,
            ),
          ],
        ),
      ),
    );
  }
}
