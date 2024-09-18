import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Authentication/google_signIn/Data/google_signIn_controller.dart';

class GoogleSigninWidget extends StatelessWidget {
  const GoogleSigninWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GoogleSigninController googleSignInController =
        GoogleSigninController();
    return Column(
      children: [
        Text(
          "Continue with".tr(),
          style:
              getBoldBlack12Style().copyWith(color: MyTheme.mainPrimaryColor4),
        ),
        GestureDetector(
          onTap: () => googleSignInController.signInWithGoogle(context),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 40.h,
            child: Image.asset(
              "assets/images/google_sginIn.png",
            ),
          ),
        ),
      ],
    );
  }
}
