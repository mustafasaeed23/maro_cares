import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maro/featuers/Home/categories/widgets/products_categories_screen.dart';
import 'package:maro/featuers/side_menu/Data/api_manger.dart';

import '../../../core/theme/styles_manager.dart';

void electronicDevices(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
            value: 0,
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
                )
              ],
            )),
        PopupMenuItem(
          value: 1,
          child: Text(
            "Hair Devices".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            firstSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Head Device".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            secoundSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            "Body Devices".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            thirdSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 4,
          child: Text(
            "Facial Devices".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            fourthSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 5,
          child: Text(
            "Foot Devices".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            fifthSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 6,
          child: Text(
            "Waxing Devices".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            sixthSubCategories(context, apiManager);
          },
        ),

      ]);
}

void firstSubCategories(BuildContext context, ApiManager apiManager) {
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text(
            "Hair Dryers and Stylers".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Dryers and Stylers".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),




      ]);
}
void secoundSubCategories(BuildContext context, ApiManager apiManager) {
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text(
            "Heated Cap".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Heated Cap".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),




      ]);
}
void thirdSubCategories(BuildContext context, ApiManager apiManager) {
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text(
            "Body Cleaning Devices".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Body Cleaning Devices".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text(
            "Steam Devices".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Steam Devices".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Massage Machines".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Massage Machines".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),




      ]);
}
void fourthSubCategories(BuildContext context, ApiManager apiManager) {
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text(
            "Shaving and Hair Removal Machines".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Shaving and Hair Removal Machines".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),




      ]);
}
void fifthSubCategories(BuildContext context, ApiManager apiManager) {
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text(
            "Foot Bath".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Foot Bath".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),




      ]);
}
void sixthSubCategories(BuildContext context, ApiManager apiManager) {
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text(
            "Waxing Machines".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Waxing Machines".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),




      ]);
}



