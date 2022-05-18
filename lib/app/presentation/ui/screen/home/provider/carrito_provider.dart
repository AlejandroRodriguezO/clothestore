import 'package:clothesstore/app/domain/model/produtos.dart';
import 'package:flutter/cupertino.dart';

class CarritoProvider extends ChangeNotifier {
  Map<String, Products> _cart = {};

  Map<String, Products> get cart => _cart;
  int counter = 0;

  void addToCart(Products item, int c) {
    Map<String, Products> copy = Map<String, Products>.from(_cart);
    copy[item.id] = item;
    _cart = copy;
    counter = c;
    notifyListeners();
  }

  void changeCounter(int v){
    counter = v;
    notifyListeners();
  }

  void deleteFromCart(Products item) {
    Map<String, Products> copy = Map<String, Products>.from(_cart);
    if (copy.containsKey(item.id)) {
      copy.remove(item.id);
      notifyListeners();
    }
  }
}
