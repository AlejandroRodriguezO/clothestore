import 'package:clothesstore/app/presentation/ui/screen/home/provider/favorito_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FavoritoTab extends StatelessWidget {
  const FavoritoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final price = NumberFormat("#,##0", "es_CO");
    final favorito = Provider.of<FavoritoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Mis Favoritos',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: ListView.builder(
        itemCount: favorito.favoritos.length,
        itemBuilder: (_, index) {
          final item = favorito.favoritos[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              '/detail',
              arguments: item,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Stack(
                children: [
                  Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 100,
                      child: Row(
                        children: [
                          Image.network(item.thumbnail),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(item.title),
                                  Text('\$${price.format(item.price)}'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      icon: Icon(
                        !favorito.isFavorite(item)
                            ? Icons.favorite_border_outlined
                            : Icons.favorite,
                        color: !favorito.isFavorite(item)
                            ? Colors.black
                            : Colors.red,
                      ),
                      onPressed: () => favorito.removeFavorito(item.id),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
