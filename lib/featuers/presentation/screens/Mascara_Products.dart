import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/Utills/utills.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/presentation/widgets/Square_Container.dart';

import '../../side_menu/show_drawer.dart';
import '../../../core/theme/my_theme.dart';
import '../../../core/translation.dart';
import '../widgets/appbar_widget_icons.dart';

class MascaraProducts extends StatelessWidget {
  const MascaraProducts({super.key});
  static const String routeName = 'mascara';

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
       leadingWidth: 160.w,
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
                     icon: Center(
                       child: Text(
                           "ع",
                           style: TextStyle(
                               backgroundColor: Colors.transparent,
                               fontSize: 18,
                               fontWeight: FontWeight.bold,
                               color: MyTheme.mainPrimaryColor4
                           )
                       ),
                     ))),
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
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("Mascara".tr(),
                          style: getSemiBoldBlack14Style(),
                        ),
                        SizedBox(height: 15.h,),
                        Text("اكتشف مجموعتنا الواسعه من ماسكارا",
                          style: getSemiBoldBlack10Style(),
                        ),
                      ],
                    ),
                    SizedBox(width: 70.w,),
                    InkWell(
                      onTap: (){
                        showOptions(context);
                      },
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color:MyTheme.greyColor,
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Icon(Icons.filter_alt_sharp, size: 30, color: MyTheme.mainPrimaryColor4,),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h,),
                const SquareContainer(),
                SizedBox(height: 20.h,),
                const SquareContainer(),
                SizedBox(height: 20.h,),
                const SquareContainer(),
                SizedBox(height: 20.h,),
                const SquareContainer(),
                SizedBox(height: 20.h,),
                const SquareContainer(),
                SizedBox(height: 20.h,),
                const SquareContainer(),



              ],
            ),
          )
      ),
    );
  }
}
