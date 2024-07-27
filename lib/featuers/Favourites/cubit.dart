import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maro/featuers/Home/Products/Data/model.dart';

class FavoriteCubit extends Cubit<List<Product>> {
  FavoriteCubit() : super([]);

  void addFavorite(Product product) {
    emit([...state, product]);
  }

  void removeFavorite(Product product) {
    emit(state.where((p) => p.sId != product.sId).toList());
  }

  bool isFavorite(Product product) {
    return state.any((p) => p.sId == product.sId);
  }
}
