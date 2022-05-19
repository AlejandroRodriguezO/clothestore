import 'package:clothesstore/app/domain/model/produtos.dart';
import 'package:clothesstore/app/presentation/ui/screen/home/provider/favorito_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final provider = FavoritoProvider();

  group('detailProvider', () {
    test('counter products', () {
      expect(provider.favoritos, equals([]));
    });
  });
}
