import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
             
            ],
          ),
          SizedBox(width: 15.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/product4.png"),
              ),
              
            ],
          ),
          SizedBox(width: 15.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/product5.png"),
              ),
          
            ],
          ),
          SizedBox(width: 20.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/product6.png"),
              ),
             
            ],
          ),
          SizedBox(width: 20.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/product7.png"),
              ),
            
            ],
          ),
          SizedBox(width: 20.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/product8.png"),
              ),
           
            ],
          ),
          SizedBox(width: 20.w,),
           Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.r,
                child: Image.asset("assets/images/product9.png"),
              ),
              
            ],
          ),
          SizedBox(width: 20.w,),
          
        ],
      ),
    );
  }
}