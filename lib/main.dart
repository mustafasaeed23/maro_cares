import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/routes/app_routes.dart';
// import 'package:maro/presentation/screens/Mascara_Products.dart';
// import 'package:maro/presentation/screens/home.dart';
// import 'package:maro/presentation/screens/products_categories.dart';
// import 'package:maro/featuers/Authentication/auth_screen.dart';
// import 'package:maro/featuers/Authentication/create_account.dart';
// import 'package:maro/featuers/Authentication/create_profile.dart';
// import 'package:maro/featuers/Products/products_details.dart';
// import 'package:maro/featuers/Splash/splash.dart';

import 'core/theme/my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AE')],
      path: 'assets/translation',
      fallbackLocale: const Locale('ar', 'AE'),
      child: MyApp(appRouter: AppRouter(),)));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter ;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        // routes: {
        //   SplashScreen.routeName: (context) => const SplashScreen(),
        //   HomeScreen.routeName: (context) => const HomeScreen(),
        //   ProductsCategories.routeName: (context) => ProductsCategories(),
        //   ProductsDetails.routeName: (context) => const ProductsDetails(),
        //   AuthScreen.routeName: (context) => const AuthScreen(),
        //   CreateProfile.routeName: (context) => const CreateProfile(),
        //   CreateAccount.routeName:(context) => const CreateAccount(),
        //   MascaraProducts.routeName:(context) => const MascaraProducts(),
        // },
        // // home: const HomeScreen(),
        // initialRoute: SplashScreen.routeName,
        // locaization
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // theme
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
