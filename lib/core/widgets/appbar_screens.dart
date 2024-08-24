import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/styles_manager.dart';

AppBar AppBarScreens(BuildContext context, final String title) {
    return AppBar(
      toolbarHeight: 60,
      title: Text(
        title.tr(),
        style: getSemiBoldBlack14Style(),
      ),
      centerTitle: true,
      leadingWidth: 65,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40.h,
          width: 40.h,
          decoration: BoxDecoration(
            color: Colors.purple.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              icon: const Center(
                child:  Icon(
                  Icons.arrow_back,
                  size: 28,
                  color: Colors.deepPurple,
                ),
              ),
              color: const Color(0xffe6d9e8),
            ),
          ),
        ),
      ),
    );
  }