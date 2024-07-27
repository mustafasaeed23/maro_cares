import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/styles_manager.dart';

// ignore: must_be_immutable
class ProductContainer extends StatelessWidget {
  String imagePath;
  String title;

  ProductContainer({super.key, required this.imagePath , required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        Center(child: Image.asset(imagePath)),
        SizedBox(height: 5.h,),
         Text(title, style: getRegularBlack12Style(),)]),
    );
  }
}
