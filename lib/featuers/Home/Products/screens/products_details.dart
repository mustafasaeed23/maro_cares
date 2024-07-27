import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/color_manager.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/widgets/custom_appbar.dart';
import 'package:maro/featuers/Cart/bloc/cart_bloc.dart';
import 'package:maro/featuers/Cart/bloc/cart_event.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';
import 'package:maro/featuers/Favourites/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductsDetailsScreen({Key? key, required this.product})
      : super(key: key);

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

  @override
  void initState() {
    super.initState();
    _displayedImage =
        widget.product.images != null && widget.product.images!.isNotEmpty
            ? widget.product.images![0]
            : 'https://via.placeholder.com/150';
    isFavorite =
        BlocProvider.of<FavoriteCubit>(context).isFavorite(widget.product);
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
      appBar: CustomAppBar('', context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite
                          ? const Color.fromARGB(255, 176, 40, 30)
                          : Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                      if (isFavorite) {
                        BlocProvider.of<FavoriteCubit>(context)
                            .addFavorite(widget.product);
                      } else {
                        BlocProvider.of<FavoriteCubit>(context)
                            .removeFavorite(widget.product);
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  InteractiveViewer(
                    transformationController: _transformationController,
                    child: Image.network(
                      _displayedImage,
                      fit: BoxFit.fill,
                      height: 300,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: images.map<Widget>((image) {
                        return GestureDetector(
                          onTap: () => updateImage(image),
                          child: Container(
                            width: 100,
                            height: 100,
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
                  SizedBox(height: 26),
                  Text(
                    widget.product.productName ?? 'No name',
                    style: getBoldBlue14Style(),
                    maxLines: 1,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: userRating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemSize: 30,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
                      const Spacer(),
                      Row(
                        children: [
                          Text("SAR".tr(),
                              style: getBoldBlack14Style().copyWith(
                                color: const Color.fromARGB(255, 7, 99, 10),
                              )),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            widget.product.price != null
                                ? "${widget.product.price} "
                                : 'No price'.tr(),
                            style: getBoldBlack14Style().copyWith(
                              color: const Color.fromARGB(255, 7, 99, 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.product.category ?? 'No category',
                    style: getMediumBlack12Style().copyWith(
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.product.description ?? 'No description',
                    style: getMediumBlack14Style(),
                  ),
                  SizedBox(height: 45),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Row(
              children: [
                Container(
                  width: 220,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyTheme.mainPrimaryColor4,
                    ),
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(AddProductToCart(widget.product));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Row(
                              children: [
                                Text(widget.product.category ?? "",
                                    style: getMediumWhite14Style()),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  "added to cart".tr(),
                                  style: getMediumWhite14Style(),
                                ),
                              ],
                            ),
                            backgroundColor: ColorManager.greenColor),
                      );
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.shopping_cart,
                            color: MyTheme.mainColor,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Add to Cart".tr(),
                            style: getMediumWhite14Style(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
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
                SizedBox(width: 8),
                Text(
                  "$counter",
                  style: getBoldBlack14Style(),
                ),
                SizedBox(width: 8),
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
