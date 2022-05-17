import 'package:clothesstore/app/domain/model/produtos.dart';
import 'package:clothesstore/app/helpers/http_response.dart';

abstract class ApiRepository {
  Future<HttpResponse<List<Products>>> productsSearch(String query);
}