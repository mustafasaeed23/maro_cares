import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maro/presentation/widgets/trending_products.dart';

class SliderProducts extends StatefulWidget {
  const SliderProducts({super.key});

  @override
  State<SliderProducts> createState() => _SliderProductsState();
}

class _SliderProductsState extends State<SliderProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: 
        [
        CarouselSlider(
          items: [1,2,3,4,5,6].map((e) {
            return TrendingWidget() ; 
          }).toList(), 
          options: CarouselOptions(

            height: 500,
             aspectRatio: 16/9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration:const  Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
        
            ),
            
           ),
           
        ],
      ),
    );
  }
}
