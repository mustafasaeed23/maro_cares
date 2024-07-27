import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maro/core/constence/Strings.dart';
import 'package:maro/featuers/Authentication/screens/auth_screen.dart';
import 'package:maro/featuers/Authentication/screens/register_screen.dart';
import 'package:maro/featuers/Authentication/screens/login_screen.dart';
import 'package:maro/featuers/Cart/Data/api_coupon.dart';
import 'package:maro/featuers/Cart/bloc/cart_bloc.dart';
import 'package:maro/featuers/Cart/screen/cart_screen.dart';
import 'package:maro/featuers/Favourites/screens/favourites_screen.dart';
import 'package:maro/featuers/Favourites/cubit.dart';
import 'package:maro/featuers/Home/brands/screens/brands_grid_screen.dart';
import 'package:maro/featuers/Home/screens/home.dart';

class AppRouter {
  final ApiManagerApplyCoupon apiManagerApplyCoupon;

  AppRouter({required this.apiManagerApplyCoupon});

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AuthenticationScreen:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case BrandsGirdScreen:
        return MaterialPageRoute(builder: (_) => BrandsGridScreen());
      case FavourieScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => FavoriteCubit(),
                  child: FavoriteScreen(),
                ));
      case ScreenCart:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      CartBloc(apiManagerApplyCoupon), // Pass the instance here
                  child: CartScreen(),
                ));
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
