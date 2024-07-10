import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maro/featuers/Home/categories/widgets/products_categories_screen.dart';
import 'package:maro/featuers/side_menu/Data/api_manger.dart';

import '../../../core/theme/styles_manager.dart';

void hairCare(BuildContext context, ApiManager apiManager){
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
                  "Hair Care".tr(),
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
              bathingAndCareSubCategories(context, apiManager);
            },
            value: 1,
            child: Text(
              "Bathing & Care".tr(),
              style: getMediumBlack16Style(),
            )),
        PopupMenuItem(
            onTap: (){
              hairDyesSubCategories(context, apiManager);
            },
            value: 1,
            child: Text(
              "Hair Dyes".tr(),
              style: getMediumBlack16Style(),
            )),
        PopupMenuItem(
            onTap: (){
              hairTreatmentSubCategories(context, apiManager);
            },
            value: 1,
            child: Text(
              "Hair Treatment".tr(),
              style: getMediumBlack16Style(),
            )),
        PopupMenuItem(
            onTap: (){
              hairAccessoriesSubCategories(context, apiManager);
            },
            value: 1,
            child: Text(
              "Hair Accessories".tr(),
              style: getMediumBlack16Style(),
            )),

      ]);
}

void bathingAndCareSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Hair Shampoo".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Shampoo".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text("Hair Conditioner".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Conditioner".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),

      ]);
}
void hairDyesSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Henna".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Henna".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text("Hair Powder".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Powder".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Hair Dye".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Dye".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text("Temporary Hair Dye".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Temporary Hair Dye".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),

      ]);
}
void hairTreatmentSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Hair Spray".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Spray".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text("Hair Crystal".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Crystal".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Hair Cream".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Cream".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text("Hair Oil".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Oil".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 4,
          child: Text("Hair Ampoules".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Ampoules".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 5,
          child: Text("Hair Serum".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Serum".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),

      ]);
}
void hairAccessoriesSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Hair Brush".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Brush".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text("Hair Comb".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Comb".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Hair Apron".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Apron".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text("Hair Scissors".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Scissors".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 4,
          child: Text("Hair Clippers".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Clippers".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 5,
          child: Text("Hair Rollers".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Hair Rollers".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),

      ]);
}