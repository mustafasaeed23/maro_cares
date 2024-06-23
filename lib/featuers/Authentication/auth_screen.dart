import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Authentication/create_profile.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  static const String routeName = 'auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          "Profile".tr(),
          style: getBoldBlack14Style(),
        ),
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
                icon: const Icon(
                  Icons.arrow_back,
                  size: 28,
                  color: Colors.deepPurple,
                ),
                color: const Color(0xffe6d9e8),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'assets/animations/Animation - 1718245198132.json',
              width: 250.w,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Text(
              "Please, Sign up to show your Profile".tr(),
              style: getSemiBoldBlack12Style(),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 150.w,
            height: 50.h,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, CreateProfile.routeName);
                },
                child: Text(
                  "Sign up".tr(),
                  style: getBoldBlue14Style(),
                )),
          )
        ],
      ),
    );
  }
}
