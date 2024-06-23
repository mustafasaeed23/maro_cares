
 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';

class OptionsBottomSheet extends StatelessWidget {
  const OptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_drop_down_outlined, size: 35,color: Colors.grey,),
                  const Spacer(),
                  Text("Options".tr(),
                  style: getSemiBoldBlack14Style(),
                  ),
                  SizedBox(width: 12.w,),
                  Icon(Icons.filter_alt, color: MyTheme.mainPrimaryColor4, size: 30,),


                ],
              ),
            ),
            SizedBox(height: 40.h,),
            Text("Price".tr(),
            style: getSemiBoldBlack14Style(),
            ),
            SizedBox(height: 20.h,),
            SizedBox(height: 30.h,),
            Text("\$0 - \$2000",
            style: getSemiBoldBlack14Style(),
            ),
            SizedBox(height: 20.h,),
            SizedBox(
              width: 350.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: MyTheme.mainPrimaryColor4),
                  onPressed: (){},
                  child: Text("Active".tr(),
                  style: getBoldWhite14Style(),
                  )),
            )
          ],
        ),
      ),
    );
  }
}