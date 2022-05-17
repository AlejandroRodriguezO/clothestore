
import 'package:clothesstore/app/domain/model/produtos.dart';
import 'package:clothesstore/app/domain/repositories/api_repository.dart';
import 'package:clothesstore/app/helpers/http.dart';
import 'package:clothesstore/app/helpers/http_response.dart';

class ApiRepositoryImpl implements ApiRepository {
  final Http _http;

  ApiRepositoryImpl(this._http);
  @override
  Future<HttpResponse<List<Products>>> productsSearch(String query) async {
    const categoryId = 'MCO1430';
    const countryId = 'MCO';

    return _http.request<List<Products>>('/sites/$countryId/search',
        queryParameters: {'q': query, 'category': categoryId, 'limit': '10'},
        parser: (data) {
      final json = data['results'] as List;
      final res = json.map((item) =>Products.fromJson(item)).toList();
      return res;
    });

  }
}
