import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/constence/Strings.dart';
import 'package:maro/core/theme/my_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushNamed(home);
    });
    return Scaffold(
      backgroundColor: MyTheme.greyColor,
      body: Center(
          child: Image.asset(
                  "assets/images/logo1.png",
                  width: 330.w,
                  fit: BoxFit.fill,
                )),
    );
  }
}
