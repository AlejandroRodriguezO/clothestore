import 'package:clothesstore/app/injection_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/my_app.dart';
import 'app/presentation/ui/screen/detail/provider/detail_provider.dart';
import 'app/presentation/ui/screen/home/provider/carrito_provider.dart';
import 'app/presentation/ui/screen/home/provider/favorito_provider.dart';
import 'app/presentation/ui/screen/search/provider/search_provider.dart';

void main() {
  setupGetIt();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoritoProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CarritoProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
