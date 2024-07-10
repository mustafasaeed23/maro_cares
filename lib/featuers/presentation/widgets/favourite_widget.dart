// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/styles_manager.dart';

class FavouriteWidget extends StatelessWidget {

  String imagePath ;

  FavouriteWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Image.asset(imagePath,
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
    ) ;
  }
}
