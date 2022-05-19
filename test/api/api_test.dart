
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() async {
  late Dio dio;
  late DioAdapter dioAdapter;

  Response<dynamic> response;

  group('Products', () {
    const baseUrl = 'https://api.mercadolibre.com';

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: baseUrl));
      dioAdapter = DioAdapter(dio: dio);
    });

    test('get products', () async {
      const route = '/sites/MCO/search';

      dioAdapter.onGet(
        route,
        (server) => server.reply(200, null),
        queryParameters: {'q': '', 'category': 'MCO1430', 'limit': '10'},
      );

      response = await dio.get(route,
          queryParameters: {'q': '', 'category': 'MCO1430', 'limit': '10'});

      expect(response.statusCode, 200);
    });
  });
}
