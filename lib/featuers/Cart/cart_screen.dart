import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // const CartScreen({super.key});
  int counter = 1 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          "Shopping Cart".tr(),
          style: getBoldBlack14Style(),
        ),
        leadingWidth: 65,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 28,
                  color: Colors.deepPurple,
                ),
                color: const Color(0xffe6d9e8),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 80.h,
              decoration: BoxDecoration(

                color: const Color(0xfff6eff7),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: const  [
                  BoxShadow(
                   blurRadius: 50,

                   offset: Offset(2, 4),
                   spreadRadius: 0,
                   blurStyle: BlurStyle.inner,
                   color: Colors.grey,
                  ),
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 30.r,
                      child: Image.asset("assets/images/product7.png"),
                    ),
                    SizedBox(width: 10.w,),
                    Text("\$ 37.3" ,
                    style: getSemiBoldBlack16Style()),
                    const Spacer(),

                      CircleAvatar(
                      backgroundColor: const Color(0xffe6d9e8),
                      child:
                      IconButton(
                        padding: const EdgeInsets.all(5),
                        onPressed: (){
                          setState(() {
                            counter-- ;

                          });
                        },
                        icon: const Icon( Icons.remove), color: Colors.deepPurple,
                          iconSize: 30.0,
                      ),
                      ),
                      SizedBox(width: 8.w,),
                      Text("$counter",
                      style: getBoldBlack14Style(),
                      ),
                       SizedBox(width: 8.w,),
                         CircleAvatar(
                         backgroundColor: const Color(0xffe6d9e8),
                           child: IconButton(
                             padding: const EdgeInsets.all(5),
                             onPressed: (){
                               setState(() {
                                 counter++ ;

                               });
                             },
                             icon: const Icon( Icons.add), color: Colors.deepPurple,
                             iconSize: 30.0,
                           ),
                      ),
                      SizedBox(width:10.w),
                      Container(
                        width: 45.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color:  const Color(0xffe6d9e8),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          ),
                        ),
                        child: const Icon(Icons.delete, color: Colors.deepPurple, size: 30,),
                      ),



                  ],
                ),
              ),

            ),
              const Spacer(),
            Text("Have a coupon?".tr(),
            style: getBoldGray12Style(),
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Container(
                  width: 295.w,
                  height: 70.h,
                  decoration:  BoxDecoration(
                  color: const Color(0xffe6d9e8),
                  boxShadow:  [
                   BoxShadow(
                    offset: const Offset(0, 6),
                    color: MyTheme.greyColor,
                    blurStyle: BlurStyle.inner
                   ),
                  ]

                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                       const  Icon(Icons.discount,size: 25,),
                        SizedBox(width: 20.w,),
                        Text("Coupon".tr(),
                        style: getSemiBoldBlack16Style(),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10.w,),
                 CircleAvatar(
                  radius: 25.r,
                      backgroundColor: const Color(0xffe6d9e8),
                      child: const Icon(Icons.check, color: Colors.deepPurple, size: 30,),
                      ),
              ],
            ),
            SizedBox(height: 10.h,),
            Center(
              child: Text("Total : 74.60\$",
              style: getSemiBoldBlack16Style(),
              ),
            ),
            SizedBox(height: 20.h,),
            SizedBox(
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6d3ca3)
                ),
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_cart, color: MyTheme.mainColor, size: 25,),
                    SizedBox(width: 8.w,),
                    Text("Confirm Payment".tr(),
                    style: getMediumWhite14Style(),
                    )
                  ],
                ),
                ),
            )

          ],
        ),
      ),
    );
  }
}
