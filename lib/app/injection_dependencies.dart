import 'package:clothesstore/app/data/api_repository_impl.dart';
import 'package:clothesstore/app/domain/repositories/api_repository.dart';
import 'package:clothesstore/app/helpers/http.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  final _dio = Dio(
    BaseOptions(baseUrl: 'https://api.mercadolibre.com'),
  );
  final _http = Http(dio: _dio);

  getIt.registerLazySingleton<Http>(
    () => _http,
  );

  getIt.registerLazySingleton<ApiRepository>(
    () => ApiRepositoryImpl(_http),
  );
}
