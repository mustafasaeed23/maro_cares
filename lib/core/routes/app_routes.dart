import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maro/core/constence/Strings.dart';
import 'package:maro/featuers/Authentication/screens/auth_screen.dart';
import 'package:maro/featuers/Authentication/screens/profile_screen.dart';
import 'package:maro/featuers/Authentication/screens/register_screen.dart';
import 'package:maro/featuers/Authentication/screens/login_screen.dart';
import 'package:maro/featuers/Cart/Data/cart_api_manger.dart';
import 'package:maro/featuers/Cart/bloc/cart_bloc.dart';
import 'package:maro/featuers/Cart/screen/cart_screen.dart';
import 'package:maro/featuers/Favourites/screens/favourites_screen.dart';
import 'package:maro/featuers/Favourites/cubit.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';
import 'package:maro/featuers/Home/brands/screens/brands_grid_screen.dart';
import 'package:maro/featuers/Home/screens/home.dart';
import 'package:maro/featuers/orders/presentation/screens/all_order_screen.dart';
import 'package:maro/featuers/orders/presentation/screens/create_order_screen.dart';

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
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
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
                  create: (context) => CartBloc(apiManagerApplyCoupon),
                  child: const CartScreen(),
                ));
      case createOrder:
        return MaterialPageRoute(builder: (_) => const CreateOrderScreen());

      case profileUserScreen:
        return MaterialPageRoute(
            builder: (_) => const ProfileScreen(
                  userName: '',
                  phoneNumber: '',
                  invtationBy: '',
                ));

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
