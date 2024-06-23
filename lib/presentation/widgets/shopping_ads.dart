import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';

class ShoppingAds extends StatelessWidget {
  const ShoppingAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: double.infinity,
      height: 350.h,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                blurRadius: 10,
                color: Colors.grey,
                blurStyle: BlurStyle.outer,
                offset: Offset(2, 2),
                spreadRadius: 10),
          ],
          borderRadius: BorderRadius.all(Radius.circular(12.r))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo1.png",
            height: 140.h,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Body Care".tr(),
            style: getSemiBoldBlack16Style(),
          ),
          SizedBox(
            height: 30.h,
          ),
           Text(
            "With your body Care deals , you can discover a range \n of products that will awaken the natural beauty of \n your skin , providing a soft and revitalizing touch",
            style: getRegularBlack12Style()
          ),
          const Spacer(),
          Container(
            height: 45.h,

            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyTheme.mainPrimaryColor4),
                onPressed: () {},
                child:  Text(
                  "Shopping now".tr(),
                  style: Theme.of(context).textTheme.headline6?.copyWith(color: MyTheme.mainColor, fontWeight: FontWeight.w600, fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
