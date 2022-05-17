
import 'package:clothesstore/app/presentation/routes/app_routes.dart';
import 'package:clothesstore/app/presentation/routes/routes.dart';
import 'package:clothesstore/app/presentation/ui/screen/detail/provider/detail_provider.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/provider/favorito_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/ui/screen/home/provider/home_provider.dart';
import 'presentation/ui/screen/search/provider/search_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoritoProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CLOTHESSTORE APP',
        initialRoute: Routes.home,
        routes: appRoutes,
      ),
    );
  }
}
