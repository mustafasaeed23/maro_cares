import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/constence/Strings.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Authentication/Data/cubit/auth_cubit.dart';
import 'package:maro/featuers/Authentication/widgets/wallet_widget.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  final String phoneNumber;
  final String invtationBy;

  const ProfileScreen(
      {super.key,
      required this.userName,
      required this.phoneNumber,
      required this.invtationBy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Welcome,".tr(),
                    style: getBoldBlack22Style(),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    userName.tr(),
                    style: getBoldBlack22Style(),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    "Phone:".tr(),
                    style: getBoldBlack22Style(),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    phoneNumber.tr(),
                    style: getBoldBlack22Style(),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    "invtationBy :".tr(),
                    style: getBoldBlack20Style(),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    invtationBy.tr(),
                    style: getBoldBlack22Style(),
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyTheme.mainPrimaryColor4,
                  ),
                  onPressed: () {
                    context.read<AuthCubit>().logout();
                  },
                  child: Text("Logout".tr(), style: getBoldWhite14Style()),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              const WalletWidget(),
              SizedBox(
                height: 80.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(allOrderScreen);
                },
                child: Row(
                  children: [
                    Text(
                      "All Orders".tr(),
                      style: getBoldBlack10Style().copyWith(fontSize: 15.sp),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.archive,
                      size: 20.sp,
                      color: MyTheme.mainPrimaryColor4,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
