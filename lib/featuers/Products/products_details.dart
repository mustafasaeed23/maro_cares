import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/presentation/widgets/Heart_Icon_Button.dart';
import 'package:maro/side_menu/show_drawer.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/presentation/widgets/appbar_widget_icons.dart';

class ProductsDetails extends StatefulWidget {
  static const String routeName = 'product_details';

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  int counter = 1;
  String displayImage = 'assets/images/trending1.jpg';
  String selectedImage = 'assets/images/trending1.jpg';
  final TransformationController _transformationController = TransformationController();

  void updateImgae(String newImgae) {
    setState(() {
      displayImage = newImgae;
      selectedImage = newImgae;
    });
    _transformationController.value = Matrix4.identity();

  }

  void dispose(){
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        leadingWidth: 170.w,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ShowDrawer(),
              SizedBox(
                width: 8.w,
              ),
              AppBarWidgetIcon(
                  iconButton: IconButton(
                      onPressed: () {
                        LocalizationChecker.changeLangauge(context);
                        // _languageChangeIcon();
                      },
                      icon: Center(
                          child: Text(
                        "ع",
                        style: TextStyle(
                            backgroundColor: Colors.transparent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: MyTheme.mainPrimaryColor4),
                      )))),
              SizedBox(
                width: 8.w,
              ),
              AppBarWidgetIcon(
                  iconButton: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.light_mode),
                color: MyTheme.mainPrimaryColor4.withOpacity(0.9),
              )),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "شامبو ترطيب عميق للشعر التالف \n من مان ان تيل 335 مل",
                    style: getBoldBlack14Style(),
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  HeartIcon(),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              InteractiveViewer(
                transformationController: _transformationController,
                child: Image.asset(
                displayImage,
                width: 300.w,
                height: 250.h,
                fit: BoxFit.contain,
              ),
                            ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => updateImgae('assets/images/trendig3.jpg'),
                    child: Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedImage == 'assets/images/trendig3.jpg' 
                          ? MyTheme.mainPrimaryColor4
                          : MyTheme.mainColor
                        ),
                      ),
                      child: Image.asset(
                        "assets/images/trendig3.jpg",
                        width: 80,
                        height: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => updateImgae("assets/images/trending4.jpg"),
                    child: Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedImage == "assets/images/trending4.jpg" 
                          ? MyTheme.mainPrimaryColor4
                          : MyTheme.mainColor
                        ),
                      ),
                      child: Image.asset(
                        "assets/images/trending4.jpg",
                        width: 80,
                        height: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => updateImgae("assets/images/trendig1.jpg"),
                    child: Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedImage == "assets/images/trendig1.jpg" 
                          ? MyTheme.mainPrimaryColor4
                          : MyTheme.mainColor
                        ),
                      ),
                      child: Image.asset(
                        "assets/images/trendig1.jpg",
                        height: 80,
                        width: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text(
                    "شامبو ترطيب عميق للشعر التالف \n من مان ان تيل 335 مل",
                    style: getBoldBlack14Style(),
                    textAlign: TextAlign.start,
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Text("37.30 ر.س",
                        style: getBoldBlack14Style()
                            .copyWith(color: Colors.green)),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "ndsfgkjdgaskjgdsakjdgskhdkuasdvshdv \nsahkdgsajkdgskjdgskajdgbsgjdgsjkdgskjdbsd \nfsdjkgsahdgsakdgsbkdjhaskd",
                style: getMediumBlack14Style(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
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
                      width: 6.w,
                    ),
                    Text("$counter", style: getBoldBlack16Style()),
                    SizedBox(
                      width: 6.w,
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
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: Container(
                      height: 50.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.shopping_cart_rounded,
                                color: MyTheme.mainColor,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Add to Cart".tr(),
                                style: getMediumWhite16Style(),
                              ),
                            ],
                          )),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
