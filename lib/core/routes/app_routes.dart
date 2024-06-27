// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:maro/core/constence/Strings.dart';
import 'package:maro/featuers/Authentication/auth_screen.dart';
import 'package:maro/featuers/Authentication/create_account.dart';
import 'package:maro/featuers/Authentication/create_profile.dart';
import 'package:maro/featuers/Products/products_details.dart';
import 'package:maro/presentation/screens/Mascara_Products.dart';
import 'package:maro/presentation/screens/home.dart';
import 'package:maro/presentation/screens/products_categories.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      // case home:
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());

      case ProductsCategoriesScreen:
        return MaterialPageRoute(builder: (_) => ProductsCategories());

      case AuthenticationScreen:
        return MaterialPageRoute(builder: (_) => const AuthScreen());

      case CreateProfileScreen:
        return MaterialPageRoute(builder: (_) => const CreateProfile());

      case CreateAccountScreen:
        return MaterialPageRoute(builder: (_) => const CreateAccount());

      case MascaraScreen:
        return MaterialPageRoute(builder: (_) => const MascaraProducts());
        
      case ProductsDetailsScreen:
        return MaterialPageRoute(builder: (_) =>  ProductsDetails());
    }
  }
}
