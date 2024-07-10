import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maro/featuers/presentation/widgets/trending_products.dart';

// class SliderProducts extends StatefulWidget {
//   const SliderProducts({super.key});

//   @override
//   State<SliderProducts> createState() => _SliderProductsState();
// }

// class _SliderProductsState extends State<SliderProducts> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: 
//         [
//         CarouselSlider(
//           items: [1,2,3,4,5,6].map((e) {
//             return Container(
//         margin: EdgeInsets.all(10),
//         width: 350.w,
//         height: 500.h,
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: MyTheme.greyColor,
//              width: 2,
//              strokeAlign: BorderSide.strokeAlignInside,
//              style: BorderStyle.solid
//              ),
//             color: MyTheme.mainColor,
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(20.r),
//               bottomRight: Radius.circular(20.r),
//               topLeft: Radius.circular(20.r),
//               topRight: Radius.circular(20.r),
//             ),
//             boxShadow: const [
//               BoxShadow(
//                   // blurRadius: 0,
//                   color: Colors.grey,
//                   blurStyle: BlurStyle.inner,
//                   // offset: Offset(0, 0),
//               ),
//             ]
//              ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               HeartIcon(),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Image.asset(
//                 "assets/images/trending1.jpg",
//                 width: 300.w,
//                 height: 200.h,
//                 fit: BoxFit.cover,
//               ),
//               SizedBox(
//                 height: 20.h,
//               ),
//               Row(
//                 children: [
//                   Text(
//                     "Loream Loream ",
//                     style: getSemiBoldBlack14Style(),
//                   ),
//                   const Spacer(),
//                   Text(
//                     "44.84 ر.س",
//                     style: getSemiBoldBlack16Style(),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 20.h,
//               ),
//               Text(
//                 "Loream",
//                 style: getBoldBlue16Style(),
//               ),
//               SizedBox(height: 10.h,),
//               Text(
//                 "cdcgdhgfsjdkfbdhgdashmdvbasnvhasvdh ",
//                 style: getRegularBlack16Style(),
//               ),
//               const Spacer(),
//               SizedBox(
//                 height: 45.h,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(backgroundColor: MyTheme.mainPrimaryColor4),
//                   onPressed: (){},
//                    child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                       const Icon(Icons.shopping_cart, size: 30,color: MyTheme.mainColor,),
//                       SizedBox(width: 5.w,),

//                        Text("Add to Cart".tr(),
//                        style: getBoldWhite14Style()),


//                      ],
//                    ) ),
//               )
//             ],
//           ),
//         ),
//             ) 
//           }).toList(), 
//           options: CarouselOptions(

//             height: 500,
//              aspectRatio: 16/9,
//         viewportFraction: 0.8,
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: true,
//         autoPlay: true,
//         autoPlayInterval: const Duration(seconds: 3),
//         autoPlayAnimationDuration:const  Duration(milliseconds: 800),
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enlargeCenterPage: true,
//         enlargeStrategy: CenterPageEnlargeStrategy.zoom,
//         enlargeFactor: 0.3,
//         scrollDirection: Axis.horizontal,
        
//             ),
            
//            ),
           
//         ],
//       ),
//     );
//   }
// }
