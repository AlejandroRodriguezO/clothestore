
import 'package:clothesstore/app/domain/model/produtos.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/ui/widgets/carrouse_widget.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/ui/widgets/dot_indicator.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/ui/widgets/moda_widget.dart';
import 'package:clothesstore/app/presentation/ui/screen/search/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final a = Provider.of<SearchProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    final price =  NumberFormat("#,##0", "es_CO");
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        shrinkWrap: true,
        children: [
          const Carrousel(),
          const DotIndicator(),
          const Moda(),
          SizedBox(
            height: size.height * 0.03,
          ),
          const Text(
            'PRODUCTOS MÁS BUSCADOS',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          FutureBuilder<List<Products>>(
            future: a.data(''),
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
                    onTap: () => Navigator.pushNamed(context, '/detail', arguments: item[index],),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        height: size.height * 0.2,
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(color: Colors.grey),
                        )),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                width: size.height * 0.12,
                                child: Image.network(item[index].thumbnail),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item[index].title),
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
                                  Text(
                                    '\$${price.format(item[index].price)}',
                                    style: const TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
