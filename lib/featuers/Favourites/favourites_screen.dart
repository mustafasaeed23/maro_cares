import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/styles_manager.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          "Favourite".tr(),
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
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
              
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: Colors.transparent,
                        child: Image.asset("assets/images/trendig1.jpg",
                        width: 80.w,
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Text("37.60 \$",
                      style: getMediumBlack16Style(),
                      ),
                      Spacer(),
                      Container(
                        width: 45.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color:  Color(0xffe6d9e8),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          ),
                        ),
                        child: Icon(Icons.favorite_rounded, color: Colors.deepPurple, size: 30,),
                      ),
                    ],
                  ),
                ),
            ),
            SizedBox(height: 15.h,),
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
              
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: Colors.transparent,
                        child: Image.asset("assets/images/trending1.jpg",
                        width: 80.w,
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Text("37.60 \$",
                      style: getMediumBlack16Style(),
                      ),
                      const Spacer(),
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
                        child:const Icon(Icons.favorite_rounded, color: Colors.deepPurple, size: 30,),
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}