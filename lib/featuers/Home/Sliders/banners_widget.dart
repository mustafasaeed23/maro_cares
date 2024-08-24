import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannersWidgetAds extends StatelessWidget {
  BannersWidgetAds({super.key});
  final items = [
    ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Image.asset(
        "assets/images/banner1.jpg",
        width: 410.w,
        height: 170.h,
        fit: BoxFit.fill,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Image.asset(
        "assets/images/banner2.jpg",
        width: 410.w,
        height: 170.h,
        fit: BoxFit.fill,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Image.asset(
        "assets/images/banner3.jpg",
        width: 410.w,
        height: 1700.h,
        fit: BoxFit.fill,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Image.asset(
        "assets/images/banner5.jpg",
        width: 410.w,
        height: 170.h,
        fit: BoxFit.fill,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
          items: items,
          options: CarouselOptions(
            height: 150,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
          )),
    );
  }
}
