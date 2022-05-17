import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  
  int _currentIndex = 0;
  int index = 0;

  int get paginaActual => _currentIndex;

  set paginaActual(int valor) {
    _currentIndex = valor;
    notifyListeners();
  }

  void pageCarrousel(int i, CarouselPageChangedReason reason) {
    index = i;
    notifyListeners();
  }
}
