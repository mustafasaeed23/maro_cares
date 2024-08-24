import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationChecker {
  static changeLangauge(BuildContext context) {
    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    if (currentLocal == const Locale('en', 'US')) {
      EasyLocalization.of(context)!.setLocale(const Locale('ar', 'AE'));
    } else {
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    }
  }
}
/*
class LanguageManagerAPi {
  String currentLanguage;

  // LanguageManagerAPi({
  //   this.currentLanguage});

   void toggleLanguage() {
   currentLanguage = currentLanguage == 'ar' ? 'en' : 'ar';
  }
}
*/

class LanguageManagerAPi {
  static final LanguageManagerAPi _instance = LanguageManagerAPi._internal();

  String currentLanguage = 'ar'; // Default language

  factory LanguageManagerAPi() {
    return _instance;
  }

  LanguageManagerAPi._internal();

  void toggleLanguage() {
    currentLanguage = currentLanguage == 'ar' ? 'en' : 'ar';
  }
}
