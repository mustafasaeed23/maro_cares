import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maro/featuers/Home/categories/widgets/products_categories_screen.dart';
import 'package:maro/featuers/side_menu/Data/api_manger.dart';

import '../../../core/theme/styles_manager.dart';

void footCare(BuildContext context, ApiManager apiManager){
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
                  "Foot Care".tr(),
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
              footMoisturisingSubCategories(context, apiManager);
            },
            value: 1,
            child: Text(
              "Foot Moisturising".tr(),
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
              skinExfoliatorsSubCategories(context, apiManager);
            },
            value: 3,
            child: Text(
              "Skin Exfoliators".tr(),
              style: getMediumBlack16Style(),
            )),
        PopupMenuItem(
            onTap: (){
              footCareToolsSubCategories(context, apiManager);
            },
            value: 4,
            child: Text(
              "Foots Care Tools".tr(),
              style: getMediumBlack16Style(),
            )),
        PopupMenuItem(
            onTap: (){
              footTreatmentSubCategories(context, apiManager);
            },
            value: 5,
            child: Text(
              "Foot Treatment".tr(),
              style: getMediumBlack16Style(),
            )),
        PopupMenuItem(
            onTap: (){
              footBathsSubCategories(context, apiManager);
            },
            value: 6,
            child: Text(
              "Foot Baths".tr(),
              style: getMediumBlack16Style(),
            )),

      ]);
}

void footMoisturisingSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Foot Cream".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Foot Cream".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 1,
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
          value: 2,
          child: Text("Foot Lotion".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Foot Lotion".tr(),
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
          child: Text("Nail Clippers".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Nail Clippers".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text("Cuticle Nippers".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Cuticle Nippers".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Nail Cooler".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Nail Cooler".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),


      ]);
}
void skinExfoliatorsSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Exfoliating Sugar".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Exfoliating Sugar".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),



      ]);
}
void footCareToolsSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Body Care Kit".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Body Care Kit".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),



      ]);
}
void footTreatmentSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Foot Treatment".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Foot Treatment".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text("Foot Deodorant".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Foot Deodorant".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),


      ]);
}
void footBathsSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Effervescent Tablets".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Effervescent Tablets".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),



      ]);
}







