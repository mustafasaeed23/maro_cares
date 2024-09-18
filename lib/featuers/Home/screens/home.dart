import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maro/featuers/Authentication/screens/auth_screen.dart';
import 'package:maro/featuers/Cart/screen/cart_screen.dart';
import 'package:maro/featuers/Favourites/screens/favourites_screen.dart';
import 'package:maro/featuers/Home/screens/home_screen_activity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final tabs = [
    HomeScreenActivity(),
    const CartScreen(),
    FavoriteScreen(),
    const AuthScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: Theme.of(context).navigationBarTheme,
        child: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (currentIndex) =>
              setState(() => this.currentIndex = currentIndex),
          destinations: [
            NavigationDestination(
                icon: const Icon(Icons.home), label: "Home".tr()),
            NavigationDestination(
                icon: const Icon(Icons.shopping_cart), label: "Cart".tr()),
            NavigationDestination(
                icon: const Icon(Icons.favorite), label: "Favourite".tr()),
            NavigationDestination(
                icon: const Icon(Icons.person), label: "Profile".tr()),
          ],
        ),
      ),
      body: IndexedStack(index: currentIndex, children: tabs),
    );
  }
}
