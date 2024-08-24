import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/routes/app_routes.dart';
import 'package:maro/featuers/Authentication/Data/auth_api_service.dart';
import 'package:maro/featuers/Authentication/Data/cubit/auth_cubit.dart';
import 'package:maro/featuers/Cart/Data/cart_api_manger.dart';
import 'package:maro/featuers/Cart/bloc/cart_bloc.dart';
import 'package:maro/featuers/Favourites/cubit.dart';
import 'package:dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final dio = Dio();
  final apiManager = ApiManagerApplyCoupon(dio);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AE')],
      path: 'assets/translation', // Ensure the path is correct
      fallbackLocale: const Locale('en', 'US'),
      child: MyApp(
        appRouter: AppRouter(apiManagerApplyCoupon: apiManager),
        apiManager: apiManager,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final ApiManagerApplyCoupon apiManager;

  const MyApp({super.key, required this.appRouter, required this.apiManager});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(AuthService()),
        ),
        BlocProvider<FavoriteCubit>(create: (context) => FavoriteCubit()),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(apiManager),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: "Maro Cares",
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          themeMode: ThemeMode.light,
        ),
      ),
    );
  }
}
