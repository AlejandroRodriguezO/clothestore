import 'package:clothesstore/app/presentation/ui/screen/home/provider/home_provider.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/ui/widgets/tabs/carrito_tab.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/ui/widgets/tabs/catalogo_tab.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/ui/widgets/tabs/favorito_tab.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/ui/widgets/tabs/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeProvider = Provider.of<HomeProvider>(context);
    final data = MediaQuery.of(context);
    return MediaQuery(
      data: data.copyWith(
        textScaleFactor: data.textScaleFactor.clamp(0.8, 1.4),
      ),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.black),
            child: BottomNavigationBar(
              currentIndex: homeProvider.paginaActual,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: const TextStyle(color: Colors.white),
              unselectedLabelStyle: const TextStyle(color: Colors.white),
              onTap: (i) => homeProvider.paginaActual = i,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'INICIO'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                    ),
                    label: 'CATÁLOGO'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_border_outlined,
                    ),
                    label: 'FAVORITOS'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                    ),
                    label: 'CARRITO'),
              ],
            ),
          ),
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                if (homeProvider.paginaActual == 0)
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    expandedHeight: size.height * 0.1,
                    pinned: true,
                    flexibleSpace: const FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text('CLOTHESSTORE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          )),
                    ),
                  ),
                if (homeProvider.paginaActual == 0)
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      const TabBar(
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
                      ),
                    ),
                    floating: true,
                  ),
              ];
            },
            body: IndexedStack(
              index: homeProvider.paginaActual,
              children: [
                TabBarView(
                  children: [
                    const HomeTab(),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: size.height * 0.2,
                            height: size.height * 0.2,
                            child: Image.asset('assets/cono.png'),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Text(
                            'ESTA SECCIÓN ESTÁ \n EN CONSTRUCCIÓN, \n ¡ESPERALA PRONTO! 👌',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: size.height * 0.2,
                            height: size.height * 0.2,
                            child: Image.asset('assets/cono.png'),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Text(
                            'ESTA SECCIÓN ESTÁ \n EN CONSTRUCCIÓN, \n ¡ESPERALA PRONTO! 👌',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const CatalogoTab(),
                const FavoritoTab(),
                const CarritoTab(),
              ],
            ),
          ),
        ),
      ),
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
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
