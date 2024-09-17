// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';

class ShoppingAds extends StatelessWidget {
  String imagePath;
  String title;

  ShoppingAds({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(12),
      width: 348.w,
      height: 350.h,
      decoration: BoxDecoration(
          border: Border.all(
              color: MyTheme.greyColor,
              width: 2,
              strokeAlign: BorderSide.strokeAlignInside,
              style: BorderStyle.solid),
          color: Colors.white,
          // boxShadow: const [
          //   BoxShadow(
          //       blurRadius: 10,
          //       color: Colors.grey,
          //       blurStyle: BlurStyle.outer,
          //       offset: Offset(2, 2),
          //       spreadRadius: 10),
          // ],
          borderRadius: BorderRadius.all(Radius.circular(12.r))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              imagePath,
              height: 150.h,
              width: 345.w,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            title.tr(),
            style: getSemiBoldBlack16Style(),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
              "With your body Care deals , you can discover a range \n of products that will awaken the natural beauty of \n your skin , providing a soft and revitalizing touch",
              style: getRegularBlack12Style()),
          const Spacer(),
          Container(
            margin: EdgeInsets.all(8),
            height: 45.h,
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyTheme.mainPrimaryColor4),
                onPressed: () {},
                child: Text(
                  "Shopping now".tr(),
                  style: getBoldWhite16Style(),
                )),
          )
        ],
      ),
    );
  }
}
