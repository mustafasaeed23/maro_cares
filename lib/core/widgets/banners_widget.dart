import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannersWidget extends StatelessWidget {
  const BannersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Image.asset(
            "assets/images/banner1.jpg",
            width: 398.w,
            height: 200.h,
            fit: BoxFit.contain,
          ),
          Image.asset(
            "assets/images/banner2.jpg",
            width: 398.w,
            height: 200.h,
            fit: BoxFit.contain,
          ),
          Image.asset(
            "assets/images/banner3.jpg",
            width: 398.w,
            height: 200.h,
            fit: BoxFit.contain,
          ),
          Image.asset(
            "assets/images/banner4.jpg",
            width: 398.w,
            height: 200.h,
            fit: BoxFit.contain,
          ),
          Image.asset(
            "assets/images/banner5.jpg",
            width: 398.w,
            height: 200.h,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
