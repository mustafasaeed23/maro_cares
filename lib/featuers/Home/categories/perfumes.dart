import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maro/featuers/Home/categories/widgets/products_categories_screen.dart';
import 'package:maro/featuers/side_menu/Data/api_manger.dart';

import '../../../core/theme/styles_manager.dart';

void perfumes(BuildContext context,ApiManager apiManager){
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
                  "Perfumes".tr(),
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
            "EAU DE Toilette (EDT)".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            firstSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Eau DE Perfume".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            secoundSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            "Oriantel Perfume".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            thirdSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            "Gift Sets".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            fourthSubCategories(context, apiManager);
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
            "Women Perfume".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Women Perfume".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text(
            "Men Perfume".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Men Perfume".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Unisex Perfume".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Unisex Perfume".tr(),
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
            "Concentrated Perfume Women".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Concentrated Perfume Women".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text(
            "Concentrated Perfume Men".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Concentrated Perfume Men".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Concentrated Perfume Unisex".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Concentrated Perfume Unisex".tr(),
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
            "Exclusive Oriental Perfumes".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Exclusive Oriental Perfumes".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text(
            "Local Oriental Perfumes".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Local Oriental Perfumes".tr(),
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
            "Women Set".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Women Set".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text(
            "Men Set".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Men Set".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),


      ]);
}



