import 'package:clothesstore/app/domain/model/produtos.dart';
import 'package:flutter/cupertino.dart';

class FavoritoProvider extends ChangeNotifier {
  final favoritos = <Products>[];

  bool isFavorite(Products product) {
    return favoritos.contains(product);
  }

  void addFavorito(Products produto) {
    favoritos.add(produto);
    notifyListeners();
  }

  void removeFavorito(String id) {
    favoritos.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
