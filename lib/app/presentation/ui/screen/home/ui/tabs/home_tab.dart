import 'package:clothesstore/app/domain/model/produtos.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/ui/widgets/carrouse_widget.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/ui/widgets/moda_widget.dart';
import 'package:clothesstore/app/presentation/ui/screen/search/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView(
      children: [
        const Carrousel(),
        const Moda(),
        SizedBox(
          height: size.height * 0.03,
        ),
        Text(
          'PRODUCTOS MÁS BUSCADOS',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const ProductosMostWanted()
      ],
    );
  }
}

class ProductosMostWanted extends StatelessWidget {
  const ProductosMostWanted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _search = context.read<SearchProvider>();
    final price = NumberFormat("#,##0", "es_CO");

    return FutureBuilder<List<Products>>(
      future: _search.data(''),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            children: List.generate(snapshot.data!.length, (index) {
              final List<Products> item = snapshot.data!;
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: item[index],
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: size.height * 0.3,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: Row(
                    children: [
                      Hero(
                        tag: item[index].id,
                        child: SizedBox(
                          width: size.width * 0.25,
                          height: size.height * 0.3,
                          child: Image.network(
                            item[index].thumbnail,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  item[index].title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '\$${price.format(item[index].price)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                    ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          );
        }
      },
    );
  }
}
