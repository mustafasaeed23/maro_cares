import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maro/featuers/Home/categories/widgets/products_categories_screen.dart';
import 'package:maro/featuers/side_menu/Data/api_manger.dart';

import '../../../core/theme/styles_manager.dart';

void medicalProducts(BuildContext context, ApiManager apiManager){
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
                  "Medical products".tr(),
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
            "Measurement Machines".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            firstSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Muscle Relaxation".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            secoundSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            "Medical Devices".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            thirdSubCategories(context, apiManager);
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
            "Blood Pressure Monitors".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Blood Pressure Monitors".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text(
            "Blood Glucose Monitors".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Blood Glucose Monitors".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Body Weight Scale".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Body Weight Scale".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            "Body Temperature Scale".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Body Temperature Scale".tr(),
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
            "Pain Relief Gel".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Pain Relief Gel".tr(),
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
            "Wound Plasters".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Wound Plasters".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text(
            "Medical Braces".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Medical Braces".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Urine Test".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Urine Test".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            "Supplements".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Supplements".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 4,
          child: Text(
            "Backache Relief Patches".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Backache Relief Patches".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 5,
          child: Text(
            "First Aid Kit".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "First Aid Kit".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),




      ]);
}


