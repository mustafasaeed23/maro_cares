import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maro/featuers/Home/categories/widgets/products_categories_screen.dart';
import 'package:maro/featuers/side_menu/Data/api_manger.dart';

import '../../../core/theme/styles_manager.dart';

void skinCare (BuildContext context, ApiManager apiManager){

  showMenu(
      context: context,
      position:  const RelativeRect.fromLTRB(50, 50, 50, 50),
      items: [
        PopupMenuItem(
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
                )
              ],
            )),
        PopupMenuItem(
            value: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Premium Care".tr(),
                  style: getMediumBlack16Style(),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                )
              ],
            ),
          onTap: (){
              premiumCareSubCategories(context, apiManager);
          },
        ),
        PopupMenuItem(
          onTap: (){
            exfoliatorSubCategories(context, apiManager);
          },
            value: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Exfoliator".tr(),
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
            masksSubCategories(context, apiManager);
          },
            value: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Masks".tr(),
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
              ampolesSubCategories(context, apiManager);
            },
            value: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ampoles".tr(),
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
              sunBlockSubCategories(context, apiManager);
            },
            value: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sun Block".tr(),
                  style: getMediumBlack16Style(),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                )
              ],
            )),
      ]
  );
}

void premiumCareSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(50, 50, 50, 50),
      items: [
        PopupMenuItem(
          value: 0,
            child: Text("Night Care".tr(),
            style: getMediumBlack16Style() ,
            ),
              onTap: (){
           Navigator.of(context).push(
               MaterialPageRoute(
               builder: (context) => ProductCategoriesScreen(
               category: 'Night Care',
               apiManager: apiManager,
           ),
               ),
           );

         },
        ),
        PopupMenuItem(
          value: 1,
          child: Text("Day Care".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'Day Care',
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Face Spray".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'Face Spray'.tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text("Moisturiser & Hydrating".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'Moisturiser & Hydrating'.tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 4,
          child: Text("Skin Treatment".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'Skin Treatment'.tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 5,
          child: Text("Whitening".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'Whitening'.tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 6,
          child: Text("Firming & Lifting".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'Firming & Lifting'.tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 7,
          child: Text("Anti Aging".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'Anti Aging'.tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 8,
          child: Text("Shining".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'Shining'.tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 9,
          child: Text("Serum".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'Serum'.tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 10,
          child: Text("Cleanser".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'Cleanser'.tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 11,
          child: Text("Toner".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'Toner'.tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
      ]);
}

void exfoliatorSubCategories(BuildContext context, ApiManager apiManager){
   showMenu(
       context: context,
       position: const RelativeRect.fromLTRB(50, 50, 50, 50),
       items: [
         PopupMenuItem(
           value: 0,
           child: Text("Scrub".tr(),
             style: getMediumBlack16Style() ,
           ),
           onTap: (){
             Navigator.of(context).push(
               MaterialPageRoute(
                 builder: (context) => ProductCategoriesScreen(
                   category: 'Scrub',
                   apiManager: apiManager,
                 ),
               ),
             );

           },
         ),
         PopupMenuItem(
           value: 1,
           child: Text("Exfoliators".tr(),
             style: getMediumBlack16Style() ,
           ),
           onTap: (){
             Navigator.of(context).push(
               MaterialPageRoute(
                 builder: (context) => ProductCategoriesScreen(
                   category: 'Exfoliators',
                   apiManager: apiManager,
                 ),
               ),
             );

           },
         ),
       ]
   );
}

void masksSubCategories(BuildContext context , ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(50, 50, 50, 50),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Face Mask".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'Face Mask',
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),

      ]);
}

void ampolesSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(50, 50, 50, 50),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Renual Ampoles".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'Renual Ampoles',
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 0,
          child: Text("Shining Ampoule".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'Shining Ampoule',
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),


      ]);
}

void sunBlockSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(50, 50, 50, 50),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("SPF Cream".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'SPF Cream',
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text("SPF Milk".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'SPF Milk',
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text("SPF Spray".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'SPF Spray',
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 0,
          child: Text("SPF Lotion".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: 'SPF Lotion',
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),

      ]);
}

