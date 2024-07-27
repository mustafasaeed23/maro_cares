import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';

// ignore: must_be_immutable
class AppBarWidgetIcon extends StatelessWidget {

  IconButton iconButton ;

  AppBarWidgetIcon({super.key, required this.iconButton});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color:MyTheme.greyColor,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Center(child: iconButton),
    );
  }
}