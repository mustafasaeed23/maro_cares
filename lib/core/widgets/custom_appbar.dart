import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/core/widgets/appbar_widget_icons.dart';
import 'package:maro/featuers/side_menu/show_drawer.dart';

AppBar CustomAppBar(final String title, BuildContext context) {
    return AppBar(
      title: Text(title,
      style: getSemiBoldBlack14Style(),
      ),
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
            SizedBox(width: 8.w),
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
                      color: MyTheme.mainPrimaryColor4,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
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
    );
  }
