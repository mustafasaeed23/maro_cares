import 'package:flutter/material.dart';
import 'package:maro/core/theme/styles_manager.dart';

class MyTheme {
  // colors
  // #e6d9e8 #6d3ca4
  static const Color mainColor = Color(0xffFFFFFF);
  static const Color blueColor = Colors.lightBlue;
  static const Color BlackColor = Colors.black;
  static const Color ColorContainer = Color(0xfff6eff7);
  static Color mainPrimaryColor4 = const Color(0xFF614BC3);
  static Color mainPrimaryColor3 = const Color(0xFF6780FE);
  static Color mainPrimaryColor2 = const Color(0xFF40FFAE);
  static Color mainPrimaryColor1 = const Color(0xFFFF8B7B);
  static Color greyColor = greyColor = Colors.grey.withOpacity(0.3);
  // light theme
  static ThemeData lightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: mainColor,
    navigationBarTheme: NavigationBarThemeData(
           
            indicatorColor: MyTheme.mainPrimaryColor4.withOpacity(0.2),
            labelTextStyle:  MaterialStatePropertyAll(
              getSemiBoldBlack10Style(),
              )),

    scaffoldBackgroundColor: mainColor,
    textTheme: const TextTheme(
      // headline1: TextStyle(
      //   fontSize: 10,
      //   fontWeight: FontWeight.bold,
      //   color: BlackColor,
      // ),
      // headline6: TextStyle(
      //   fontSize: 10,
      //   fontWeight: FontWeight.w700,
      //   color: BlackColor,
      // ),
      // subtitle1: TextStyle(
      //   fontSize: 25,
      //   fontWeight: FontWeight.w400,
      //   color: BlackColor,
      // ),
      // subtitle2: TextStyle(
      //   fontSize: 22,
      //   fontWeight: FontWeight.w400,
      //   color: BlackColor,
      // ),
    
    ),
  );


  // dark theme
  static ThemeData darkTheme = ThemeData(
    primaryColor: BlackColor,
    appBarTheme: const AppBarTheme(
      color: MyTheme.BlackColor
    ),
    scaffoldBackgroundColor: BlackColor.withOpacity(0.4),

    navigationBarTheme:  NavigationBarThemeData(
      
      backgroundColor: BlackColor,
       indicatorColor: MyTheme.mainColor,
            labelTextStyle:  MaterialStatePropertyAll(
              getSemiBoldWhite10Style(),
              )

    )
  );
}
