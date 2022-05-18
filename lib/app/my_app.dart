import 'package:clothesstore/app/presentation/routes/app_routes.dart';
import 'package:clothesstore/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData windowData =
        MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    windowData = windowData.copyWith(
      textScaleFactor: windowData.devicePixelRatio > 2.5
          ? 0.8
          : windowData.textScaleFactor.clamp(0.8, 1.5),
      devicePixelRatio: windowData.devicePixelRatio.clamp(1.4, 2),
    );
    return MediaQuery(
      data: windowData,
      child: MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        title: 'CLOTHESSTORE APP',
        initialRoute: Routes.home,
        routes: appRoutes,
      ),
    );
  }
}
