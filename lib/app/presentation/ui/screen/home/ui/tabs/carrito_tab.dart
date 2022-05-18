import 'package:clothesstore/app/domain/model/produtos.dart';
import 'package:clothesstore/app/presentation/ui/global_widgets/counter.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/provider/carrito_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CarritoTab extends StatelessWidget {
  const CarritoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = context.watch<CarritoProvider>().cart.values.toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Carrito',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      bottomNavigationBar:
          _cart.isNotEmpty ? const CheckOrder() : const SizedBox.shrink(),
      body: Consumer<CarritoProvider>(
        builder: (context, value, _) {
          return _cart.isNotEmpty
              ? ListView.builder(
                  itemCount: _cart.length,
                  itemBuilder: (context, index) {
                    final item = _cart[index];
                    return ItemCart(
                      item: item,
                    );
                  },
                )
              : Center(
                  child: Text(
                    'Carrito vacio',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                );
        },
      ),
    );
  }
}

class ItemCart extends StatefulWidget {
  const ItemCart({Key? key, required this.item}) : super(key: key);
  final Products item;

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final price = NumberFormat("#,##0", "es_CO");
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.2,
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.all(10).copyWith(bottom: 5),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(10),
                  left: Radius.circular(10),
                ),
                child: Image.network(
                  widget.item.thumbnail,
                  fit: BoxFit.contain,
                ),
              ),
              flex: 2,
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${price.format(widget.item.price)}',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.deepPurple,
                                  ),
                        ),
                        Consumer<CarritoProvider>(builder: (context, v, _) {
                          return Counter(
                            initialValue: v.counter,
                            onChanged: (i) => v.changeCounter(i),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

class CheckOrder extends StatelessWidget {
  const CheckOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final price = NumberFormat("#,##0", "es_CO");
    final controller = context.watch<CarritoProvider>();
    final subtotal = controller.cart.values
        .map((e) => e.price * controller.counter)
        .toList()
        .reduce((v, e) => v + e);
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Table(
            children: [
              TableRow(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    'Subtotal',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '\$${price.format(subtotal)}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              TableRow(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    'Envio',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Gratis',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              TableRow(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    'Total',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '\$${price.format(subtotal)}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: CupertinoButton(
              color: Colors.white,
              child: Text(
                'Check Out',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
