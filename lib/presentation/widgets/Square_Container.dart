import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';

class SquareContainer extends StatelessWidget {
  const SquareContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 290.h,
      decoration: BoxDecoration(
        color: MyTheme.mainColor,
        borderRadius: BorderRadius.all(Radius.circular(25.r)),
        boxShadow: [
          BoxShadow(
            color: MyTheme.greyColor,
            blurStyle: BlurStyle.outer,
            offset: const Offset(0, 0),
            blurRadius: 7,
            spreadRadius: 5
          ),
        ],

      ),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.end,
         children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Icon(Icons.favorite_outline_sharp, size: 30, color: MyTheme.BlackColor, ),
                 SizedBox(height: 10.h,),
                 Text("Mascara mascara \n mascara mscara",
                 style: getBoldBlack12Style(),
                 ),
                 SizedBox(height: 10.h,),
                 Text("Mascara".tr(),
                 style: getBoldBlue12Style(),
                   textAlign: TextAlign.start,
                 ),
                 SizedBox(height: 10.h,),
                 Text("Description :".tr(),
                  style: getMediumBlack15Style(),
                 ),
                 SizedBox(height: 10.h,),
                 Text("Loream vdsdbhdsv dfjk \n fjsdgfhjasdvhasvdhfhhfhf\n fnsjkdfghvdgfdhfgfh",
                 style: getMediumBlack15Style(),
                 ),
                 SizedBox(height: 5.h,),
                 Text("45 ر.س",
                 style: getSemiBoldBlack14Style(),
                 ),
                 SizedBox(height: 8.h,),
                 ElevatedButton(
                   style: ElevatedButton.styleFrom(backgroundColor: MyTheme.mainPrimaryColor4),
                     onPressed: (){},
                     child: Row(
                       children: [
                         Icon(Icons.shopping_cart, color: MyTheme.mainColor, size: 20,),
                         SizedBox(width: 5.w,),
                         Text("Add to Cart".tr(),
                         style: getRegularWhite12Style(),
                         ),
                       ],
                     ))
               ],
             ),
           ),
           Spacer(),
           Image.asset("assets/images/mascara.jpg",
           width: 150.w,
             height: 250.h,
             fit: BoxFit.cover,
           ),
         ],
      ),
    );
  }
}
