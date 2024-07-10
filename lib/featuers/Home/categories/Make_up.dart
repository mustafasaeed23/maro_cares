import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maro/featuers/Home/categories/widgets/products_categories_screen.dart';
import 'package:maro/featuers/side_menu/Data/api_manger.dart';

import '../../../core/theme/styles_manager.dart';



void makeUp(BuildContext context, ApiManager apiManager){
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
          onTap: (){
            faceSubCategories(context, apiManager);
          },
            value: 1,
            child: Text(
              "Face".tr(),
              style: getMediumBlack16Style(),
            )),
        PopupMenuItem(
          onTap: (){
            eyesSubCategories(context, apiManager);
          },
            value: 2,
            child: Text(
              "Eyes".tr(),
              style: getMediumBlack16Style(),
            )),
        PopupMenuItem(
          onTap: (){
            lipsSubCategories(context, apiManager);
          },
            value: 3,
            child: Text(
              "Lips".tr(),
              style: getMediumBlack16Style(),
            )),
        PopupMenuItem(
          onTap: (){
            nailsSubCategories(context, apiManager);
          },
            value: 4,
            child: Text(
              "Nails".tr(),
              style: getMediumBlack16Style(),
            )),
      ]);
  
}

void faceSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Primer & Base".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Primer & Base".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text("Foundation".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Foundation".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Powder".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Powder".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text("Concealer".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Concealer".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 4,
          child: Text("BB Cream".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "BB Cream".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 5,
          child: Text("CC Cream".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "CC Cream".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 6,
          child: Text("Blush".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Blush".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 7,
          child: Text("Make-Up Suppliments".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Make-Up Suppliments".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 8,
          child: Text("Illuminator & Highlighter".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Illuminator & Highlighter".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 9,
          child: Text("Bronzer".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Bronzer".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 10,
          child: Text("Contour".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Contour".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 11,
          child: Text("Makeup Brushes".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Makeup Brushes".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 12,
          child: Text("Sponges".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category:"Sponges".tr() ,
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 13,
          child: Text("Make Up Remover".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Make Up Remover".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 14,
          child: Text("Make up fixing".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category:"Make up fixing".tr() ,
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 15,
          child: Text("Make up Pads".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Make up Pads".tr() ,
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 16,
          child: Text("Gift Sets".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category:"Gift Sets".tr() ,
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),

      ]);
}

void eyesSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40) ,
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Eye Shadow".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Eye Shadow".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text("Brow liner".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Brow liner".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Brow Mascara".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Brow Mascara".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text("Brow Gel".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Brow Gel".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 4,
          child: Text("Mascara".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Mascara".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 5,
          child: Text("Eye Liner".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Eye Liner".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 6,
          child: Text("EyeBrows".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "EyeBrows".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 7,
          child: Text("Primer & Base".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Primer & Base".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 8,
          child: Text("Eye Palettes".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Eye Palettes".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 9,
          child: Text("Eye Lashes & Curlers".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Eye Lashes & Curlers".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 10,
          child: Text("Eye Make Up Remover".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Eye Make Up Remover".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 11,
          child: Text("Lenses".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Lenses".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 12,
          child: Text("Brow & Lashes Tools".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Brow & Lashes Tools".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 13,
          child: Text("Gift Sets".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Gift Sets".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),

      ]);
}

void lipsSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Lipstick".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Lipstick".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text("lip plumper".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "lip plumper".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Lip scrub".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Lip scrub".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text("Liquid Lipstick".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Liquid Lipstick".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 4,
          child: Text("Lip Liner".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Lip Liner".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 5,
          child: Text("Lip Stain".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Lip Stain".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 6,
          child: Text("Gloss".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Gloss".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 7,
          child: Text("Gift Sets".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Gift Sets".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),

      ]);
}

void nailsSubCategories(BuildContext context, ApiManager apiManager){
  showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(40, 40, 40, 40),
      items: [
        PopupMenuItem(
          value: 0,
          child: Text("Nail Polish".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Nail Polish".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 1,
          child: Text("Nail file".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Nail file".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Nail Tools".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Nail Tools".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 3,
          child: Text("Nail Polish Remover".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Nail Polish Remover".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 4,
          child: Text("Nail Stickers".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Nail Stickers".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 5,
          child: Text("Nails Tretment".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Nails Tretment".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 6,
          child: Text("Base Coat & Top Coats".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Base Coat & Top Coats".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 7,
          child: Text("Nail Kit".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Nail Kit".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),
        PopupMenuItem(
          value: 8,
          child: Text("Gift Set".tr(),
            style: getMediumBlack16Style() ,
          ),
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductCategoriesScreen(
                  category: "Gift Set".tr(),
                  apiManager: apiManager,
                ),
              ),
            );

          },
        ),

      ]);
}


