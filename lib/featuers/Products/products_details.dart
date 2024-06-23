import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/side_menu/show_drawer.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/presentation/widgets/appbar_widget_icons.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({super.key});
  static const String routeName = 'product_details';

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
                },
                icon: const Icon(Icons.abc),
                color: MyTheme.mainPrimaryColor4,
              )),
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
                  Text("شامبو ترطيب عميق للشعر التالف \n من مان ان تيل 335 مل",
                  style: getBoldBlack14Style(),
                  textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.favorite_outline_outlined, size: 30, color: Colors.black,),
                    ),
                ],
              ),
               
               SizedBox(height: 20.h,),
               Image.asset("assets/images/trending1.jpg",
               width: 300.w,
               height: 250.h,
               fit: BoxFit.cover,
               ),

               SizedBox(height: 20.h,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: MyTheme.mainPrimaryColor3),
                    ),
                  ),
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: MyTheme.mainPrimaryColor3),
                    ),
                  ),
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: MyTheme.mainPrimaryColor3),
                    ),
                  ),
                ],
               ),
               SizedBox(height: 20.h,),

                Row(
                children: [
                  Text("شامبو ترطيب عميق للشعر التالف \n من مان ان تيل 335 مل",
                  style: getBoldBlack14Style(),
                  textAlign: TextAlign.start,
                  ),
                  
                  Spacer(),
                  
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Text("37.30 ر.س" ,
                    style: getBoldBlack14Style().copyWith(color: Colors.green)
                    ),
                  ),
                ],

              ),
              SizedBox(height: 20.h,),
              Text("ndsfgkjdgaskjgdsakjdgskhdkuasdvshdv \nsahkdgsajkdgskjdgskajdgbsgjdgsjkdgskjdbsd \nfsdjkgsahdgsakdgsbkdjhaskd",
              style: getMediumBlack14Style(),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      child: Icon(Icons.remove, size: 25,),
                    ),
                    SizedBox(width: 6.w,),
                    Text("1",
                    style: getBoldBlack16Style()
                    ),
                    SizedBox(width: 6.w,),

                    CircleAvatar(
                      radius: 20.r,
                      child: Icon(Icons.add, size: 25,),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                        child: Container(
                          height: 50.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                              onPressed: (){},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.shopping_cart_rounded, color: MyTheme.mainColor,),
                                  SizedBox(width: 10.w,),
                                  Text("Add To Cart".tr(),
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
