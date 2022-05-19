import 'package:clothesstore/app/domain/model/produtos.dart';
import 'package:clothesstore/app/presentation/ui/global_widgets/counter.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/provider/carrito_provider.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/provider/favorito_provider.dart';
import 'package:clothesstore/app/presentation/utils/detalle_imagen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    final cantity =
        context.select<CarritoProvider, Map<String, Products>>((_) => _.cart);
    final item = ModalRoute.of(context)!.settings.arguments as Products;
    final price = NumberFormat("#,##0", "es_CO");
    final size = MediaQuery.of(context).size;
    final favorito = context.watch<FavoritoProvider>();
    final _cart = context.watch<CarritoProvider>();

    
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
                    content: Text(
                      'Se agrego a favoritos',
                      textAlign: TextAlign.center,
                    ),
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
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  _cart.addToCart(item, counter);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Se agrego al carrito',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
              if (_cart.cart.isNotEmpty)
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    alignment: Alignment.center,
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.redAccent,
                    ),
                    child: Text(
                      '${cantity.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 8),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: CupertinoButton(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(50),
          child: const Text('Comprar Ahora'),
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: [
          _buildImage(context, item, size),
          _buildHeader(item, context, size, price),
          SizedBox(
            height: size.height * 0.02,
          ),
          _buildDelivery(size),
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
        ],
      ),
    );
  }

  Container _buildDelivery(Size size) {
    return Container(
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
    );
  }

  GestureDetector _buildImage(BuildContext context, Products item, Size size) {
    return GestureDetector(
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
      child: Hero(
        tag: item.id,
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
    );
  }

  Container _buildHeader(
      Products item, BuildContext context, Size size, NumberFormat price) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: Theme.of(context).textTheme.headline6,
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
              Counter(
                onChanged: (i) {
                  setState(
                    () {
                      counter = i++;
                    },
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
