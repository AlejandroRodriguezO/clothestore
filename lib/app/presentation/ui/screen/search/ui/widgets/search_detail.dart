import 'package:clothesstore/app/presentation/ui/global_widgets/result_widget.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/ui/home_page.dart';
import 'package:clothesstore/app/presentation/ui/screen/search/provider/search_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchDetailPage extends StatefulWidget {
  const SearchDetailPage({Key? key}) : super(key: key);

  @override
  _SearchDetailPageState createState() => _SearchDetailPageState();
}

class _SearchDetailPageState extends State<SearchDetailPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
          leading: Consumer<SearchProvider>(
              builder: (context, searchProvider, child) => IconButton(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false),
                  icon: const Icon(Icons.arrow_back))),
          backgroundColor: Colors.white,
          title: Column(
            children: [
              Text(
                args,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_list),
            ),
          ],
        ),
        body: ResultSearch(
          query: args,
          list: false,
        ));
  }
}
