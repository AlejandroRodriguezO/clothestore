import 'package:clothesstore/app/presentation/routes/routes.dart';
import 'package:clothesstore/app/presentation/ui/screen/detail/ui/detail_page.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/ui/home_page.dart';
import 'package:flutter/widgets.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.home: (_) => const HomePage(),
      Routes.detail: (_) => const DetailPage(),
    };
