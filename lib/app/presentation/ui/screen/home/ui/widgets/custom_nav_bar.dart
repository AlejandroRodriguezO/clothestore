
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key, required this.index, required this.onTap})
      : super(key: key);
  final int index;
  final  ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {

  

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.black),
      child: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        onTap: (i) => onTap!.call(i),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'INICIO'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'CATÁLOGO'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
              ),
              label: 'FAVORITOS'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: 'CARRITO'),
        ],
      ),
    );
  }
}
