import 'package:clothesstore/app/domain/model/produtos.dart';
import 'package:clothesstore/app/presentation/ui/screen/search/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ResultSearch extends StatelessWidget {
  const ResultSearch({
    Key? key,
    required this.query,
    this.list = true,
  }) : super(key: key);

  final String query;
  final bool list;

  @override
  Widget build(BuildContext context) {
    final _search = context.read<SearchProvider>();
    final price = NumberFormat("#,##0", "es_CO");
    final size = MediaQuery.of(context).size;

    return FutureBuilder<List<Products>>(
      future: _search.data(query),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return list
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    final List<Products> item = snapshot.data!;
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: item[index],
                      ),
                      child: ListTile(
                        title: Text(item[index].title),
                        leading: CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              item[index].thumbnail,
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: snapshot.data!.length)
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final List<Products> item = snapshot.data!;
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          '${item.length} resultados en "$query"',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: 18),
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: item[index],
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: size.height * 0.2,
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                width: size.width * 0.12,
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
                  },
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.black,
                    indent: 15,
                    endIndent: 15,
                  ),
                  itemCount: snapshot.data!.length,
                );
        }
      },
    );
  }
}
