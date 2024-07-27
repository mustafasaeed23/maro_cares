import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maro/core/widgets/shopping_ads.dart';

class AdsSlider extends StatelessWidget {
  AdsSlider({super.key});
  final items = [
    ShoppingAds(
      imagePath: "assets/images/bodycare.jpg", 
      title: 'Body Care',),
    ShoppingAds(imagePath: "assets/images/Skincare.jpg",
     title: 'Skin Care ',),
   ShoppingAds(imagePath: "assets/images/suncare.jpg",
    title: 'Sun Care',),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
          items: items,
          options: CarouselOptions(
            height: 350,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            autoPlay: true,
          )),
    );
  }
}
