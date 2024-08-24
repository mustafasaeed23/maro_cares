import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Home/categories/Body_Care.dart';
import 'package:maro/featuers/Home/categories/Foot_Care.dart';
import 'package:maro/featuers/Home/categories/Hair_care.dart';
import 'package:maro/featuers/Home/categories/Hand_Care.dart';
import 'package:maro/featuers/Home/categories/Make_up.dart';
import 'package:maro/featuers/Home/categories/Mouth_Care.dart';
import 'package:maro/featuers/Home/categories/Skin_Care.dart';
import 'package:maro/featuers/Home/categories/accessories.dart';
import 'package:maro/featuers/Home/categories/care_for_mom_child.dart';
import 'package:maro/featuers/Home/categories/electronic_devices.dart';
import 'package:maro/featuers/Home/categories/home_care.dart';
import 'package:maro/featuers/Home/categories/medical_products.dart';
import 'package:maro/featuers/Home/categories/perfumes.dart';
import 'package:maro/featuers/side_menu/Data/api_manger.dart';
import '../../core/theme/my_theme.dart';

class ShowDrawer extends StatefulWidget {
  const ShowDrawer({super.key});

  @override
  State<ShowDrawer> createState() => _ShowDrawerState();
}

class _ShowDrawerState extends State<ShowDrawer> {
  bool iconChange = false;
  final ApiManager apiManager = ApiManager();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.h,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: IconButton(
        onPressed: () {
          // setState(() {
          //   iconChange =! iconChange;
          // });
          showMenu(
              elevation: 10,
              popUpAnimationStyle: AnimationStyle(),
              constraints: const BoxConstraints(minHeight: 250),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
              ),
              context: context,
              position: const RelativeRect.fromLTRB(40, 40, 40, 40),
              items: [
                PopupMenuItem<int>(
                  value: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Skin Care".tr(),
                        style: getMediumBlack16Style(),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                  onTap: () {
                    skinCare(context, apiManager);
                  },

                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Body Care".tr(),
                        style: getMediumBlack16Style(),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                  onTap: (){
                    bodyCare(context, apiManager);
                  },
                ),
                PopupMenuItem<int>(
                  onTap: () {
                  makeUp(context,apiManager);
                  },
                  value: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Make-up".tr(),
                        style: getMediumBlack16Style(),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hair Care".tr(),
                        style: getMediumBlack16Style(),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                  onTap: (){
                    hairCare(context,apiManager);
                  },
                ),
                PopupMenuItem<int>(
                  value: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mouth Care".tr(),
                        style: getMediumBlack16Style(),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                  onTap: (){
                    mouthCare(context, apiManager);
                  },
                ),
                PopupMenuItem<int>(
                  value: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hand Care".tr(),
                        style: getMediumBlack16Style(),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                  onTap: (){
                    handCare(context,apiManager);
                  },
                ),
                PopupMenuItem<int>(
                  value: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Foot Care".tr(),
                        style: getMediumBlack16Style(),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                  onTap: (){
                    footCare(context, apiManager);
                  },
                ),
                PopupMenuItem<int>(
                  value: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Care for mother and child".tr(),
                        style: getMediumBlack16Style(),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                  onTap: (){
                    careForMomAndChild(context,apiManager);
                  },
                ),
                PopupMenuItem<int>(
                  value: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Accessories".tr(),
                        style: getMediumBlack16Style(),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                  onTap: (){
                    accessories(context,apiManager);
                  },
                ),
                PopupMenuItem<int>(
                  value: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Perfumes".tr(),
                        style: getMediumBlack16Style(),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                  onTap: (){
                    perfumes(context,apiManager);
                  },
                ),
                PopupMenuItem<int>(
                  value: 11,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Medical products".tr(),
                        style: getMediumBlack16Style(),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                  onTap: (){
                    medicalProducts(context,apiManager);
                  },
                ),
                PopupMenuItem<int>(
                  value: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Home care".tr(),
                        style: getMediumBlack16Style(),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                  onTap: (){
                    homeCare(context,apiManager);
                  },
                ),
                PopupMenuItem<int>(
                  value: 13,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Electronic Devices".tr(),
                        style: getMediumBlack16Style(),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                  onTap: (){
                    electronicDevices(context,apiManager);
                  },
                ),
              ]);
        },
        icon: const Icon(Icons.menu),
        color: MyTheme.mainPrimaryColor4,
      ),
    );
  }
}


