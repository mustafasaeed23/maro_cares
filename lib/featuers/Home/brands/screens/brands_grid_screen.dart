import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/core/widgets/custom_appbar.dart';
import 'package:maro/featuers/Home/brands/screens/brands_screen_list.dart';
import 'package:maro/core/widgets/appbar_widget_icons.dart';
import 'package:maro/featuers/side_menu/show_drawer.dart';

class BrandsGridScreen extends StatelessWidget {
  static const String routeName = 'brnads_Grid';

  final List<String> brandNamesList = [
    "Afle",
    "La Roche posay",
    "Agrado",
    "Close up",
    "Air Queen",
    "Anjou",
    "Baby Zone",
    "Beauty Star",
    "Bioderma",
    "Bio-Oil",
    "Bixdent",
    "Black",
    "Bourjois",
    "Cantu",
    "Carefree",
    "CeraVe",
    "Clean & Clear",
    "Clear",
    "Clere",
    "Cotton Plus",
    "Cream 21",
    "Depend",
    "Diva",
    "Dorco",
    "Dr. Rashel",
    "E.l.f ",
    "Essence",
    "Eucerin",
    "Flexitol",
    "Garden Olean ",
    "Garnier",
    "Giovanni",
    "Glycerin",
    "Hair System",
    "Hansaplast",
    "Himalaya",
    "Hobelabs",
    "Ikeratin",
    "Isdin",
    "Johnson",
    "L`Oreal",
    "Labello",
    "Leivy",
    "Life-Flo",
    "Listerine",
    "Make Over 22",
    "Mandy",
    "Mac",
    "Maybelline",
    "Missha",
    "Moodmatcher",
    "Nature's Answer",
    "Neutrogena",
    "Nivea",
    "Nu-Pore",
    "Ofra",
    "Ogx",
    "O'keeffe's",
    "Olaplex",
    "Ordinary",
    "Palmer's",
    "Pixi",
    "Professional",
    "Qv",
    "Revolution",
    "Sairo",
    "Sebamed",
    "Shifa",
    "Shimmer",
    "Shimmer Lights",
    "Silky",
    "Silky Cool",
    "Spa System",
    "Titania",
    "Tony Moly",
    "Trind",
    "Yorx",
    "Mane n tail",
    "Safeeza",
    "Flamingo",
    "Almontaj",
    "Gluta-c",
    "Jessica",
    "Natured",
    "Mavala",
    "Queen view",
    "Lipo base",
    "Sense of Argan",
    "Hammam el hana",
    "Voloria",
    "Tesori d' oriente",
    "Estelin",
    "Yc",
    "X8 body hardware",
    "Pantene",
    "Vichy",
    "Shea moisture",
    "Bigen",
    "Eco tools",
    "Ear sense",
    "Wadi Al nahil",
    "Revlon",
    "Munchkin",
    "Reverse",
    "Purederm",
    "Gillette",
    "Real techniques",
    "I'm sorry",
    "Carissa",
    "Konoz",
    "Parodontax",
    "Paw patrol",
    "Dettol",
    "Always",
    "L.A girl",
    "Dove",
    "Arm & hammer",
    "Amwaj",
    "Italus",
    "Silk surgical",
    "Rexona",
    "Fresh me",
    "Shams",
    "Head & shoulders",
    "Parachute",
    "Mustela",
    "Uriage",
    "Crest",
    "Sensodyne",
    "Avalon",
    "Timeless",
    "Lens me",
    "Aloedent",
    "Sani plast",
    "Lakme",
    "Benefit",
    "Oral B",
    "Carrot sun",
    "Summer's eve",
    "J-castal",
    "Wella",
    "Al Arayes",
    "Schick intuition",
    "Colgate",
    "Cute",
    "Global star",
    "Signal",
    "Laikou",
    "TECE",
    "OZ Naturals",
    "Missha",
    "Vaseline",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("All Brands", context),
      body: GridView.builder(
        padding: EdgeInsets.all(12.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 10.w, // Spacing between columns
          mainAxisSpacing: 10.h, // Spacing between rows
          childAspectRatio: 1.2, // Adjust as needed
        ),
        itemCount: brandNamesList.length,
        itemBuilder: (context, index) {
          var brandName = brandNamesList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BrandsScreenList(brandName: brandName),
                ),
              );
            },
            child: Card(
              elevation: 2,
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/cetaphil.png",
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      brandName.tr(),
                      style: getBoldBlue14Style(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
