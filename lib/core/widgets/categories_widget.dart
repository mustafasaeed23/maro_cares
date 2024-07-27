import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/styles_manager.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/gift.png"),
              ),
              SizedBox(height: 10.h,),
              Text("Gift", 
              style: getBoldBlue16Style())
            ],
          ),
          SizedBox(width: 20.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/suntan.png"),
              ),
              SizedBox(height: 10.h,),
              Text("Suntan",
               style: getBoldBlue16Style())
            ],
          ),
          SizedBox(width: 15.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/skincare.png"),
              ),
              SizedBox(height: 10.h,),
              Text("Skincare", 
              style: getBoldBlue16Style())
            ],
          ),
          SizedBox(width: 15.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/qv.png"),
              ),
              SizedBox(height: 10.h,),
              Text("QV",
               style: getBoldBlue16Style())
            ],
          ),
          SizedBox(width: 20.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/device.png"),
              ),
              SizedBox(height: 10.h,),
              Text("Device",
               style: getBoldBlue16Style())
            ],
          ),
          SizedBox(width: 20.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/cetaphil.png"),
              ),
              SizedBox(height: 10.h,),
              Text("Cetaphil", 
              style: getBoldBlue16Style())
            ],
          ),
          SizedBox(width: 20.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child:  Image.asset("assets/images/biooderma.png"),
              ),
              SizedBox(height: 10.h,),
              Text("Biooderma",
               style: getBoldBlue16Style())
            ],
          ),
          SizedBox(width: 20.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/man.png"),
              ),
              SizedBox(height: 10.h,),
              Text("Man",
               style: getBoldBlue16Style())
            ],
          ),
          SizedBox(width: 20.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset("assets/images/medcial.png"),
                radius: 50.r,
              ),
              SizedBox(height: 10.h,),
              Text("Medical", 
              style: getBoldBlue16Style())
            ],
          ),
        ],
      ),
    );
  }
}