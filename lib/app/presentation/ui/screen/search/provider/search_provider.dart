
import 'package:clothesstore/app/domain/model/produtos.dart';
import 'package:clothesstore/app/domain/repositories/api_repository.dart';
import 'package:clothesstore/app/injection_dependencies.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  final apiRepository = getIt<ApiRepository>();

  final PageController _pageController = PageController();

  PageController get pageController => _pageController;

  int _currentIndex = 0;
  int get paginaActual => _currentIndex;

  Future<List<Products>> data(String query) async {
    final response = await apiRepository.productsSearch(query);
    if (response.data != null) {
      return response.data!;
    } else {
      throw Exception();
    }
  }

  set paginaActual(int valor) {
    _currentIndex = valor;
    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }
}
