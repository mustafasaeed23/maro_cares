import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/featuers/presentation/screens/Mascara_Products.dart';
import 'package:maro/core/theme/styles_manager.dart';
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
                  onTap: () {
                    apiManager.fetchData('Hair Shampo', 1, 'ar');
                  },
                  value: 0,
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
                ),
                PopupMenuItem<int>(
                  onTap: () {
                    showMenu(
                        elevation: 10,
                        popUpAnimationStyle: AnimationStyle(),
                        constraints: const BoxConstraints(minHeight: 250),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        ),
                        context: context,
                        position: const RelativeRect.fromLTRB(50, 50, 50, 50),
                        items: [
                          PopupMenuItem(
                              value: 0,
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
                                  )
                                ],
                              )),
                          PopupMenuItem(
                              value: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Face".tr(),
                                    style: getMediumBlack16Style(),
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  )
                                ],
                              )),
                          PopupMenuItem(
                              onTap: () {
                                showMenu(
                                    context: context,
                                    position: const RelativeRect.fromLTRB(
                                        50, 50, 50, 50),
                                    items: [
                                      PopupMenuItem(
                                          value: 0,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Make-up".tr(),
                                                    style:
                                                        getMediumBlack16Style(),
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text(
                                                      "Eyes".tr(),
                                                      style:
                                                          getRegularBlack10Style(),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Eye shadow".tr(),
                                                style: getMediumBlack16Style(),
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Brow Liner".tr(),
                                                style: getMediumBlack16Style(),
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Eyebrow mascara".tr(),
                                                style: getMediumBlack16Style(),
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: 4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Eyebrow gel".tr(),
                                                style: getMediumBlack16Style(),
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                MascaraProducts.routeName);
                                          },
                                          value: 5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Mascara".tr(),
                                                style: getMediumBlack16Style(),
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: 6,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Eyeliner".tr(),
                                                style: getMediumBlack16Style(),
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: 7,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Eyebrows".tr(),
                                                style: getMediumBlack16Style(),
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: 8,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Premier around the eye".tr(),
                                                style: getMediumBlack16Style(),
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: 9,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Eye palette".tr(),
                                                style: getMediumBlack16Style(),
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: 10,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Eyelashes for eyes".tr(),
                                                style: getMediumBlack16Style(),
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: 11,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Makeup remover".tr(),
                                                style: getMediumBlack16Style(),
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: 12,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Eyes lenses".tr(),
                                                style: getMediumBlack16Style(),
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: 13,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Equipment for eyebrows and eyes"
                                                    .tr(),
                                                style: getMediumBlack16Style(),
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: 14,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Gift set".tr(),
                                                style: getMediumBlack16Style(),
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                      PopupMenuItem(
                                          value: 15,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Return to subcategories".tr(),
                                                style: getMediumBlack16Style(),
                                              ),
                                              Divider(
                                                color: MyTheme.greyColor,
                                                thickness: 1,
                                              ),
                                            ],
                                          )),
                                    ]);
                              },
                              value: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Eyes".tr(),
                                    style: getMediumBlack16Style(),
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  )
                                ],
                              )),
                          PopupMenuItem(
                              value: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lips".tr(),
                                    style: getMediumBlack16Style(),
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  )
                                ],
                              )),
                          PopupMenuItem(
                              value: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nails".tr(),
                                    style: getMediumBlack16Style(),
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  )
                                ],
                              )),
                          PopupMenuItem(
                              onTap: () {},
                              value: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Back".tr(),
                                    style: getMediumBlack16Style(),
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  )
                                ],
                              )),
                        ]);
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
                ),
                PopupMenuItem<int>(
                  value: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Oral Care".tr(),
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
                ),
              ]);
        },
        icon: const Icon(Icons.menu),
        color: MyTheme.mainPrimaryColor4,
      ),
    );
  }
}


