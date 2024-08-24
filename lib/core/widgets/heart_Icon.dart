import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Favourites/cubit.dart';
import 'package:maro/featuers/Favourites/screens/favourites_screen.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';

class HeartIcon extends StatefulWidget {
  final Product product;

  HeartIcon({required this.product});

  @override
  _HeartIconState createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = context.read<FavoriteCubit>().isFavorite(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        size: 30,
        color: isFavorite
            ? const Color.fromARGB(255, 138, 24, 15)
            : null, // Set color to red when favorite
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FavoriteScreen(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(widget.product.category ?? "",
                        style: getMediumWhite14Style()),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      "added to favourite, press to show".tr(),
                      style: getMediumWhite14Style(),
                    ),
                  ],
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 138, 24, 15)),
        );
        if (isFavorite) {
          context.read<FavoriteCubit>().removeFavorite(widget.product);
        } else {
          context.read<FavoriteCubit>().addFavorite(widget.product);
        }
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
