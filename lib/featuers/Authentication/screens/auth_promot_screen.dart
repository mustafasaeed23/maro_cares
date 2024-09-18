import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:maro/core/constence/Strings.dart';
import 'package:maro/core/theme/styles_manager.dart';

class AuthPrompt extends StatelessWidget {
  const AuthPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          width: 170.w,
          height: 50.h,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, login);
              },
              child: Text(
                "Sign up".tr(),
                style: getBoldBlue14Style(),
              )),
        )
      ],
    );
  }
}
