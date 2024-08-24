import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/core/widgets/custom_appbar.dart';
import 'package:maro/core/widgets/heart_icon.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';
import 'package:maro/featuers/Favourites/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maro/featuers/Home/Products/widgets/eleveted_button_widget.dart';
import 'package:maro/featuers/Home/Products/widgets/product_price_widget.dart';
import 'package:maro/featuers/user/api_services_user.dart';

class ProductsDetailsScreen extends StatefulWidget {
  final Product product;
  final LanguageManagerAPi languageManager; 

  const ProductsDetailsScreen({super.key, required this.product, required this.languageManager}); // Update constructor

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  int counter = 1;
  String _displayedImage = '';
  final TransformationController _transformationController =
      TransformationController();
  bool isFavorite = false;
  double userRating = 0.0;
  final LanguageManagerAPi languageManager = LanguageManagerAPi();

  final APIServiceUser apiServiceUser =
      APIServiceUser(baseUrl: 'https://maro-cares-z86j.onrender.com');

  @override
  void initState() {
    super.initState();
    _displayedImage =
        widget.product.images != null && widget.product.images!.isNotEmpty
            ? widget.product.images![0]
            : 'https://via.placeholder.com/150';
    isFavorite =
        BlocProvider.of<FavoriteCubit>(context).isFavorite(widget.product);
    userRating = widget.product.totalRating?.toDouble() ?? 0.0;
  }

  void updateImage(String newImage) {
    setState(() {
      _displayedImage = newImage;
    });
    _transformationController.value = Matrix4.identity();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var images = widget.product.images ??
        [
          'https://via.placeholder.com/150',
          'https://via.placeholder.com/150',
          'https://via.placeholder.com/150',
          'https://via.placeholder.com/150'
        ];

    return Scaffold(
      appBar:CustomAppBar(title: "") ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: HeartIcon(
                      product: widget.product,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  InteractiveViewer(
                    transformationController: _transformationController,
                    child: Image.network(
                      _displayedImage,
                      fit: BoxFit.fill,
                      height: 300.h,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: images.map<Widget>((image) {
                        return GestureDetector(
                          onTap: () => updateImage(image),
                          child: Container(
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: _displayedImage == image
                                    ? MyTheme.mainPrimaryColor4
                                    : Colors.transparent,
                                width: _displayedImage == image ? 3 : 1,
                              ),
                            ),
                            child: Image.network(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 26.h),
                  Text(
                    widget.product.productName ?? 'No name',
                    style: getBoldBlue14Style(),
                    maxLines: 1,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: userRating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemSize: 30,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            userRating = rating;
                          });
                        },
                      ),
                      SizedBox(width: 10.h),
                      const Spacer(),
                      ProductPriceWidget(widget: widget),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.product.category ?? 'No category',
                    style: getMediumBlack12Style().copyWith(
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.product.description ?? 'No description',
                    style: getMediumBlack14Style(),
                  ),
                  SizedBox(height: 45.h),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Row(
              children: [
                SizedBox(
                  width: 220.w,
                  child: ElevetedButtonWidget(widget: widget),
                ),
                SizedBox(width: 10.w),
                CircleAvatar(
                  backgroundColor: const Color(0xffe6d9e8),
                  child: IconButton(
                    padding: const EdgeInsets.all(5),
                    onPressed: () {
                      if (counter == 1) {
                        return;
                      } else {
                        setState(() {
                          counter--;
                        });
                      }
                    },
                    icon: const Icon(Icons.remove),
                    color: Colors.deepPurple,
                    iconSize: 30.0,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  "$counter",
                  style: getBoldBlack14Style(),
                ),
                SizedBox(width: 8.w),
                CircleAvatar(
                  backgroundColor: const Color(0xffe6d9e8),
                  child: IconButton(
                    padding: const EdgeInsets.all(5),
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                    icon: const Icon(Icons.add),
                    color: Colors.deepPurple,
                    iconSize: 30.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
