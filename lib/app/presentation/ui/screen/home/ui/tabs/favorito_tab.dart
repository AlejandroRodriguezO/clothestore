import 'package:clothesstore/app/domain/model/produtos.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/provider/favorito_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FavoritoTab extends StatelessWidget {
  const FavoritoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorito = context.watch<FavoritoProvider>();
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
      body: favorito.favoritos.isNotEmpty
          ? ListView.builder(
              itemCount: favorito.favoritos.length,
              itemBuilder: (_, index) {
                final item =
                    favorito.favoritos[(favorito.favoritos.length - 1) - index];
                return FavoritoWidget(item: item);
              },
            )
          : Center(
              child: Text(
                'No tienes favoritos',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
    );
  }
}

class FavoritoWidget extends StatelessWidget {
  const FavoritoWidget({Key? key, required this.item}) : super(key: key);

  final Products item;

  @override
  Widget build(BuildContext context) {
    final price = NumberFormat("#,##0", "es_CO");
    final size = MediaQuery.of(context).size;
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
                height: size.height * 0.2,
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.3,
                      height: size.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(item.thumbnail),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                '\$${price.format(item.price)}',
                                style: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
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
              child: Consumer<FavoritoProvider>(builder: (context, value, _) {
                return IconButton(
                  icon: Icon(
                    !value.isFavorite(item)
                        ? Icons.favorite_border_outlined
                        : Icons.favorite,
                    color: !value.isFavorite(item) ? Colors.black : Colors.red,
                  ),
                  onPressed: () => value.removeFavorito(item.id),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
