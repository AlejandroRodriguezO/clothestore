import 'package:flutter/cupertino.dart';

class DetailProvider extends ChangeNotifier {
  int _count = 1;

  // Getters
  int get count => _count;

  // Setters
  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    if (_count > 1) {
      _count--;
    }else{

    }
    notifyListeners();
  }
}
