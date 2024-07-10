import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/styles_manager.dart';

class Products extends StatelessWidget {
  const Products({super.key});

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
                child: Image.asset("assets/images/biooderma.png"),
              ),
              Text("Bioderma",
              style: getBoldBlue16Style(),
              ),
              
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
              Text("Cetaphil",
                style: getBoldBlue16Style(),
              ),
             
            ],
          ),
          SizedBox(width: 15.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/somebymi.png"),
              ),
              Text("Some By Mi",
                style: getBoldBlue16Style(),
              ),

              
            ],
          ),
          SizedBox(width: 15.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/advancedclinicals.png"),
              ),
              Text("Advanced \n Clinicals",
                style: getBoldBlue16Style(),
              ),

          
            ],
          ),
          SizedBox(width: 20.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/beautyofjoseon.png"),
              ),
              Text("Beauty \n Of Josen",
                style: getBoldBlue16Style(),
                textAlign: TextAlign.center,

              ),
             
            ],
          ),
          SizedBox(width: 20.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/ImsorryformySkin.png"),
              ),
              Text("I M sorry \n for my Skin",
                style: getBoldBlue16Style(),
                textAlign: TextAlign.center,
              ),

            
            ],
          ),
          SizedBox(width: 20.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/theOrdinary.png"),
              ),
              Text("The Ordinary",
                style: getBoldBlue16Style(),
              ),
           
            ],
          ),
          SizedBox(width: 20.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/Mielle.png"),
              ),
              Text("Mielle",
                style: getBoldBlue16Style(),
              ),

              
            ],
          ),
          SizedBox(width: 20.w,),
          
        ],
      ),
    );
  }
}