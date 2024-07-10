import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maro/featuers/Home/categories/widgets/products_categories_screen.dart';
import 'package:maro/featuers/side_menu/Data/api_manger.dart';

import '../../../core/theme/styles_manager.dart';

void careForMomAndChild(BuildContext context, ApiManager apiManager) {
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
                  "Care for mother and child".tr(),
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
            "Diapers & Changing".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            diapersAndChangingSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Mommy Care".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            mommyCareSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            "Child Care".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            childCareSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 4,
          child: Text(
            "Baby Food & Tools".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            babyFoodAndToolsSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          value: 5,
          child: Text(
            "Bathing & Care".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            bathingAndCareSubCategories(context, apiManager);
          },
        ),
      ]);
}

void diapersAndChangingSubCategories(
    BuildContext context, ApiManager apiManager) {
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text(
            "Diapers".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Diapers".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 1,
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
        PopupMenuItem(
          value: 2,
          child: Text(
            "Baby Cream".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Baby Cream".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
      ]);
}
void mommyCareSubCategories(BuildContext context, ApiManager apiManager) {
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text(
            "Milk Pump".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Milk Pump".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text(
            "Feminine Wipes".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Feminine Wipes".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Breast Cover".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Breast Cover".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
      ]);
}
void childCareSubCategories(BuildContext context, ApiManager apiManager) {
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text(
            "Baby Perfume".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Baby Perfume".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
      ]);
}
void babyFoodAndToolsSubCategories(BuildContext context, ApiManager apiManager) {
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text(
            "Baby Nipples".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Baby Nipples".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text(
            "Baby Milk Bottles".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Baby Milk Bottles".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Baby Food Products".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Feeding Equipments".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),

      ]);
}
void bathingAndCareSubCategories(BuildContext context, ApiManager apiManager) {
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text(
            "Baby Moisturizer".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Baby Moisturizer".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text(
            "Baby Shampoo".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Baby Shampoo".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Baby Oils".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Baby Oils".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            "Baby Wash".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Baby Wash".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 4,
          child: Text(
            "Baby Gift Set".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Baby Gift Set".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),
        PopupMenuItem(
          value: 5,
          child: Text(
            "Baby Powder".tr(),
            style: getMediumBlack16Style(),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Baby Powder".tr(),
                  apiManager: apiManager,
                ),
              ),
            );
          },
        ),



      ]);
}



