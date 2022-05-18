import 'package:clothesstore/app/presentation/ui/screen/home/ui/widgets/custom_appbar.dart';
import 'package:clothesstore/app/presentation/ui/screen/search/provider/search_provider.dart';
import 'package:clothesstore/app/presentation/ui/screen/search/ui/widgets/search_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogoTab extends StatelessWidget {
  const CatalogoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<SearchProvider>(
      builder: (_, searchProvider, __) => PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: searchProvider.pageController,
        children: [
          ListView(
            children: const [
              CustomAppBar(),
              ImagesSearch(),
            ],
          ),
          const SearchDetailPage()
        ],
      ),
    ));
  }
}

class ImagesSearch extends StatelessWidget {
  const ImagesSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(
        7,
        (index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: size.height * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$index.jpg'), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
