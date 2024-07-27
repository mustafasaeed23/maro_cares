import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/featuers/Favourites/cubit.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';
import 'package:maro/featuers/Home/Products/screens/products_details.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          "Favourite".tr(),
          style: getSemiBoldBlack14Style(),
        ),
        centerTitle: true,
        leadingWidth: 65,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40.h,
            width: 40.h,
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
                icon: Center(
                  child: const Icon(
                    Icons.arrow_back,
                    size: 28,
                    color: Colors.deepPurple,
                  ),
                ),
                color: const Color(0xffe6d9e8),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<FavoriteCubit, List<Product>>(
        builder: (context, favoriteProducts) {
          if (favoriteProducts.isEmpty) {
            return Center(
                child: Text(
              "You Favourite List is empty, Add Some Items".tr(),
              style: getBoldBlack12Style()
                  .copyWith(color: MyTheme.mainPrimaryColor4),
            ));
          }
          return ListView.builder(
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) {
              final product = favoriteProducts[index];
              var imageUrl =
                  product.images != null && product.images!.isNotEmpty
                      ? product.images![0]
                      : 'https://via.placeholder.com/150';
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    // Navigtor to screen details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductsDetailsScreen(product: product),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.network(imageUrl),
                      title: Text(
                        product.category ?? 'No name',
                        style: getBoldBlack14Style()
                            .copyWith(color: MyTheme.mainPrimaryColor4),
                      ),
                      subtitle: Row(
                        children: [
                          Text("SAR".tr(), style: getBoldBlack14Style()),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            product.price != null
                                ? '${product.price}'
                                : 'No price'.tr(),
                            style: getBoldBlack14Style(),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: const Color.fromARGB(255, 219, 36, 23),
                        ),
                        onPressed: () {
                          context.read<FavoriteCubit>().removeFavorite(product);
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
