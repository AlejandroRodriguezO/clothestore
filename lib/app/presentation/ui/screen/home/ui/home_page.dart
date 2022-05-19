
import 'package:clothesstore/app/presentation/ui/screen/home/ui/tabs/carrito_tab.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/ui/tabs/catalogo_tab.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/ui/tabs/favorito_tab.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/ui/widgets/tab_bar_view.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaActual = 0;

  void changePagina(int index) {
    setState(() {
      paginaActual = index;
    });
  }

  List<Widget> pages = const [
    BuildTabBarView(),
    CatalogoTab(),
    FavoritoTab(),
    CarritoTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: CustomNavBar(
            onTap: (i) => changePagina(i),
            index: paginaActual,
          ),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                if (paginaActual == 0) const AppBarCustom(),
                if (paginaActual == 0)
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      _buildTabBar(),
                    ),
                    pinned: true,
                  ),
              ];
            },
            body: IndexedStack(
              index: paginaActual,
              children: pages,
            ),
          ),
        ),
      ),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(
      indicatorPadding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      indicatorColor: Colors.black,
      labelColor: Colors.black87,
      unselectedLabelColor: Colors.grey,
      tabs: [
        Tab(text: 'DESTACADOS'),
        Tab(text: 'CATEGORIAS'),
        Tab(text: 'PARA ELLA'),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: size.height * 0.1,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          'CLOTHESSTORE',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
