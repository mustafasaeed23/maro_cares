import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maro/featuers/Home/categories/widgets/products_categories_screen.dart';
import 'package:maro/featuers/side_menu/Data/api_manger.dart';

import '../../../core/theme/styles_manager.dart';

void homeCare(BuildContext context, ApiManager apiManager){
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
                  "Home care".tr(),
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
            "Antiseptics".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            firstSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Fregrance".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            secoundSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            "Batteries".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            thirdSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 4,
          child: Text(
            "Washing".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            fourthSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 5,
          child: Text(
            "Tissues".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            fifthSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 6,
          child: Text(
            "Sticks".tr(),
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
            "Food Supplements".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Food Supplements".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text(
            "Alcohol Spray".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Alcohol Spray".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Surface Disinfectant".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Surface Disinfectant".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            "Air Fresheners".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Air Fresheners".tr(),
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
            "Furniture Perfumes".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Furniture Perfumes".tr(),
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
            "Batteries".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Batteries".tr(),
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
            "Dishwashing Products".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Dishwashing Products".tr(),
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
            "Scented Napkins".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Scented Napkins".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text(
            "Disposable Napkins".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Disposable Napkins".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Wet Wipes".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Wet Wipes".tr(),
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
            "Wooden Cotton Swabs".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Wooden Cotton Swabs".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text(
            "Ear Cotton Swabs".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Ear Cotton Swabs".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),




      ]);
}





