import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteCubit extends Cubit<List<Product>> {
  FavoriteCubit() : super([]) {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getString('favorites');
    if (favoritesJson != null) {
      final List<dynamic> favoritesList = json.decode(favoritesJson);
      emit(favoritesList.map((e) => Product.fromJson(e)).toList());
    }
  }

  Future<void> addFavorite(Product product) async {
    final updatedFavorites = [...state, product];
    emit(updatedFavorites);
    await _saveFavorites(updatedFavorites);
  }

  Future<void> removeFavorite(Product product) async {
    final updatedFavorites = state.where((p) => p.sId != product.sId).toList();
    emit(updatedFavorites);
    await _saveFavorites(updatedFavorites);
  }

  bool isFavorite(Product product) {
    return state.any((p) => p.sId == product.sId);
  }

  Future<void> _saveFavorites(List<Product> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = json.encode(favorites.map((p) => p.toJson()).toList());
    await prefs.setString('favorites', favoritesJson);
  }
}
