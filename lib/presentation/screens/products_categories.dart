import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/presentation/widgets/product_container.dart';

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
            SizedBox(height: 60.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProductContainer(imagePath: "assets/images/product4.png"),
                SizedBox(width: 40.w,),
                ProductContainer(imagePath: "assets/images/product5.png"),
              ],
            ),
            SizedBox(height: 50.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProductContainer(imagePath: "assets/images/cetaphil.png"),
                SizedBox(width: 40.w,),
                ProductContainer(imagePath: "assets/images/biooderma.png"),
              ],
            ),
            SizedBox(height: 50.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProductContainer(imagePath: "assets/images/product6.png"),
                SizedBox(width: 40.w,),
                ProductContainer(imagePath: "assets/images/product7.png"),
              ],
            ),
            SizedBox(height: 50.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProductContainer(imagePath: "assets/images/product8.png"),
                SizedBox(width: 40.w,),
                ProductContainer(imagePath: "assets/images/product9.png"),
              ],
            ),
            SizedBox(height: 50.h,),
            Container(
              width: 322.w,
              height: 110.h,
              
              decoration:  BoxDecoration(
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
          spreadRadius: 10
          ),
        ],
              ),
              child: Image.asset("assets/images/qv.png"),
      ),
                  SizedBox(height: 60.h,),

            
          
          ],
        ),
      ),
    );
  }
}
