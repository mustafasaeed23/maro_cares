import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Authentication/auth_screen.dart';
import 'package:maro/featuers/Authentication/create_account.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

  static const String routeName = 'create_profile';

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
                  Navigator.of(context).pushNamed(AuthScreen.routeName);
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
        children: [
          Center(
            child: Lottie.asset(
              'assets/animations/Animation - 1718245911646.json',
              width: 250.w,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Icon(
                  Icons.phone_android_rounded,
                  size: 30,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  width: 285.w,
                  height: 70.h,
                  decoration:
                      BoxDecoration(color: Color(0xffe6d9e8), boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 6),
                        color: MyTheme.greyColor,
                        blurStyle: BlurStyle.inner),
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      "011156*****",
                      style: getSemiBoldBlack16Style(),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          SizedBox(
            height: 45.h,
            width: 300.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: MyTheme.mainPrimaryColor4),
              onPressed: () {},
              child: Text(
                "Sign up".tr(),
                style: getBoldWhite14Style(),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(CreateAccount.routeName);
            },
            child: Text(
              "Create Account".tr(),
              style: getBoldBlue16Style(),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          SizedBox(
            width: 210.w,
            height: 50.h,
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Sign in with Google",
                  style: getBoldBlue14Style(),
                )),
          )
        ],
      ),
    );
  }
}
