import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Products/products_details.dart';

// ignore: must_be_immutable
class TrendingWidget extends StatelessWidget {
  bool isColorFilled = false;

  TrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (){
            Navigator.pushReplacementNamed(context, ProductsDetails.routeName);
          },
          child: Container(
            width: 310.w,
            height: 500.h,
            decoration: BoxDecoration(
                color: MyTheme.mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey,
                      blurStyle: BlurStyle.outer,
                      offset: Offset(0, 4),
                      spreadRadius: 10),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(

                      onPressed: () {},

                      icon : const Icon(Icons.favorite_outline_sharp,
                        size: 30,
                        color: MyTheme.BlackColor,
                      )
                    //
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset(
                    "assets/images/trending1.jpg",
                    width: 300.w,
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Loream Loream ",
                        style: getSemiBoldBlack14Style(),
                      ),
                      const Spacer(),
                      Text(
                        "44.84 ر.س",
                        style: getSemiBoldBlack16Style(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Loream",
                    style: getBoldBlue16Style(),
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    "cdcgdhgfsjdkfbdhgdashmdvbasnvhasvdh ",
                    style: getRegularBlack16Style(),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 45.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: MyTheme.mainPrimaryColor4),
                      onPressed: (){},
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                          const Icon(Icons.shopping_cart, size: 30,color: MyTheme.mainColor,),
                          SizedBox(width: 5.w,),

                           Text("Add to Cart".tr(),
                           style: getBoldWhite14Style()),


                         ],
                       ) ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
