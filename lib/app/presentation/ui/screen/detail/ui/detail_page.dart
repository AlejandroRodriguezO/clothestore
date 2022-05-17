import 'package:clothesstore/app/domain/model/produtos.dart';
import 'package:clothesstore/app/presentation/ui/global_widgets/counter.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/provider/favorito_provider.dart';
import 'package:clothesstore/app/presentation/utils/detalle_imagen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Products;
    final price = NumberFormat("#,##0", "es_CO");
    final size = MediaQuery.of(context).size;
    final favorito = Provider.of<FavoritoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () =>
                Share.share('Mira este maravilloso producto ${item.permalink}'),
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {
              if (!favorito.isFavorite(item)) {
                favorito.addFavorito(item);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Se agrego a favoritos'),
                  ),
                );
              } else {
                favorito.removeFavorito(item.id);
              }
            },
            icon: favorito.isFavorite(item)
                ? const Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                  )
                : const Icon(Icons.favorite_border_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () => showGeneralDialog(
              context: context,
              barrierColor: Colors.black,
              transitionDuration: const Duration(milliseconds: 400),
              pageBuilder: (_, animation, __) => FadeTransition(
                opacity: animation,
                child: DetailImage(
                  image: item.thumbnail,
                ),
              ),
            ),
            child: Container(
              width: size.width,
              height: size.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(item.thumbnail),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${price.format(item.price)}',
                      style: const TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    const Counter()
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.local_shipping_outlined,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    const Text(
                      'Envio Gratis',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    'Recíbelo del 22 al 26 de Julio \nen Medellín',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 10,
          ),
          const ListTile(
            title: Text(
              'Detalles del producto',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 10,
          ),
          const ListTile(
            title: Text(
              'Reseñas del producto',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                const Text(
                  '5.0',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                ...List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            alignment: Alignment.center,
            width: size.width,
            height: kToolbarHeight,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Comprar ahora',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
