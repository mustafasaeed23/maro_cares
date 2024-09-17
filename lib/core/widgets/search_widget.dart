import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maro/core/api/search_api.dart';
import 'package:maro/core/theme/my_theme.dart';
import 'package:maro/core/theme/styles_manager.dart';
import 'package:maro/core/translation.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';
import 'package:maro/featuers/Home/Products/screens/products_details.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  final ApiSearch _apiSearch = ApiSearch();
  final LanguageManagerAPi languageManager = LanguageManagerAPi();

  List<Product> _searchResults = [];
  bool _isLoading = false;
  bool _isSearching = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (_searchController.text.length > 1) {
        _searchProducts(_searchController.text);
      }
    });
  }

  Future<void> _searchProducts(String searchTerm) async {
    setState(() {
      _isLoading = true;
      _isSearching = true;
    });

    List<Product> results = await _apiSearch.searchProducts(searchTerm);

    setState(() {
      _searchResults = results;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 347.w,
            height: _isSearching ? 60.h : 60.h,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      String searchTerm = _searchController.text;
                      if (searchTerm.isNotEmpty) {
                        _searchProducts(searchTerm);
                      }
                    },
                    icon: const Icon(Icons.search),
                    color: Colors.black,
                    iconSize: 25,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                        border: InputBorder.none,
                        hintText: "Search".tr(),
                        hintStyle: getBoldBlack12Style(),
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isSearching = false;
                        _searchController.clear();
                        _searchResults.clear();
                      });
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_isSearching)
          SizedBox(
            height: 300.h,
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: EdgeInsets.all(12.sp),
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      var product = _searchResults[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductsDetailsScreen(
                                product: product,
                                languageManager: languageManager,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            leading: Image.network(product.images![0]),
                            title: Row(
                              children: [
                                Text(
                                  product.category ?? 'No name',
                                  style: getBoldBlack12Style().copyWith(
                                      color: MyTheme.mainPrimaryColor4),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  product.brand ?? "",
                                  style: getRegularBlack10Style().copyWith(
                                      color: MyTheme.mainPrimaryColor4),
                                )
                              ],
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
                          ),
                        ),
                      );
                    },
                  ),
          ),
      ],
    );
  }
}
