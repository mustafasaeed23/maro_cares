import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maro/featuers/Home/categories/widgets/products_categories_screen.dart';
import 'package:maro/featuers/side_menu/Data/api_manger.dart';


import '../../../core/theme/styles_manager.dart';

void handCare(BuildContext context, ApiManager apiManager){
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
                  "Hand Care".tr(),
                  style: getMediumBlack16Style(),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                )
              ],
            )),
        PopupMenuItem(
            onTap: (){
              handMoisturisingSubCategories(context, apiManager);
            },
            value: 1,
            child: Text(
              "Hand Moisturising".tr(),
              style: getMediumBlack16Style(),
            )),
        PopupMenuItem(
            onTap: (){
              nailsCareSubCategories(context, apiManager);
            },
            value: 2,
            child: Text(
              "Nails Care".tr(),
              style: getMediumBlack16Style(),
            )),
        PopupMenuItem(
            onTap: (){
              handTreatmentSubCategories(context, apiManager);
            },
            value: 3,
            child: Text(
              "Hand Treatment".tr(),
              style: getMediumBlack16Style(),
            )),


      ]);
}

void handMoisturisingSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Moisturizing Gloves".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Moisturizing Gloves".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text("Hand Cream".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hand Cream".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Hand Lotion".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hand Lotion".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),

      ]);
}
void nailsCareSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Nail Moisturizer".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Nail Moisturizer".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),


      ]);
}
void handTreatmentSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Crack and Roughness Treatment".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Crack and Roughness Treatment".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text("Sweat Treatment".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Sweat Treatment".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),

      ]);
}



