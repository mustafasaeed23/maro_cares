import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/featuers/presentation/widgets/Heart_Icon_Button.dart';
import 'package:maro/featuers/presentation/widgets/appbar_widget_icons.dart';
import 'package:maro/featuers/side_menu/show_drawer.dart';

class ProductsDetails extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductsDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  int counter = 1;
  String _displayedImage = '';
  final TransformationController _transformationController =
      TransformationController();

  @override
  void initState() {
    super.initState();
    _displayedImage = widget.product['images'] != null &&
            widget.product['images'].isNotEmpty
        ? widget.product['images'][0]
        : 'https://via.placeholder.com/150';
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
    var images = widget.product['images'] ?? [
      'https://via.placeholder.com/150',
      'https://via.placeholder.com/150',
      'https://via.placeholder.com/150',
      'https://via.placeholder.com/150'
    ];

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 10,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0),
            child: Image.asset(
              "assets/images/logo2.png",
              fit: BoxFit.fill,
              width: 70.h,
              height: 50.h,
            ),
          ),
        ],
        leadingWidth: 160.w,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const ShowDrawer(),
              SizedBox(
                width: 8.w,
              ),
              AppBarWidgetIcon(
                iconButton: IconButton(
                  onPressed: () {
                    LocalizationChecker.changeLangauge(context);
                  },
                  icon: Center(
                    child: Text("ع",
                        style: TextStyle(
                            backgroundColor: Colors.transparent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: MyTheme.mainPrimaryColor4)),
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              AppBarWidgetIcon(
                iconButton: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.light_mode),
                  color: MyTheme.mainPrimaryColor4.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  HeartIcon(),
                  SizedBox(
                    height: 20.h,
                  ),
                  InteractiveViewer(
                    transformationController: _transformationController,
                    child: Image.network(
                      _displayedImage,
                      fit: BoxFit.cover,
                      height: 300,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
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
                  SizedBox(height: 26.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.product['productName'] ?? 'No name',
                          style: getBoldBlue14Style(),
                          maxLines: 1,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        widget.product['price'] != null
                            ? '\$${widget.product['price']}'
                            : 'No price',
                        style: getBoldBlack14Style().copyWith(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 7, 99, 10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    widget.product['category'] ?? 'No category',
                    style: getMediumBlack12Style().copyWith(
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(height: 10.h),
                  Text(
                    widget.product['description'] ?? 'No description',
                    style: getMediumBlack14Style(),
                  ),
                  SizedBox(height: 45.h),
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
                  width: 220.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyTheme.mainPrimaryColor4,
                    ),
                    onPressed: () {},
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.shopping_cart,
                            color: MyTheme.mainColor,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          Text(
                            "Add to Cart".tr(),
                            style: getMediumWhite14Style(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                CircleAvatar(
                  backgroundColor: const Color(0xffe6d9e8),
                  child: IconButton(
                    padding: const EdgeInsets.all(5),
                    onPressed: () {
                      setState(() {
                        counter--;
                      });
                    },
                    icon: const Icon(Icons.remove),
                    color: Colors.deepPurple,
                    iconSize: 30.0,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "$counter",
                  style: getBoldBlack14Style(),
                ),
                SizedBox(
                  width: 8.w,
                ),
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
