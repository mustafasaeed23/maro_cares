import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/constence/Strings.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/core/widgets/appbar_widget_icons.dart';
import 'package:maro/featuers/side_menu/show_drawer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: getSemiBoldBlack14Style(),
      ),
      scrolledUnderElevation: 10,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(home);
            },
            child: Image.asset(
              "assets/images/logo2.png",
              fit: BoxFit.fill,
              width: 70.h,
              height: 50.h,
            ),
          ),
        ),
      ],
      leadingWidth: 160.w,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const ShowDrawer(),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: () {},
              child: AppBarWidgetIcon(
                iconButton: IconButton(
                  onPressed: () {
                    LocalizationChecker.changeLangauge(context);
                    LanguageManagerAPi().toggleLanguage();
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
            ),
            SizedBox(width: 8.w),
            AppBarWidgetIcon(
              iconButton: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ScreenCart);
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 22,
                ),
                color: MyTheme.mainPrimaryColor4.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
