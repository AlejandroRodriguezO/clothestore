import 'package:clothesstore/app/presentation/ui/screen/detail/provider/detail_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final provider = DetailProvider();
  group('detailProvider', () {
    final count = provider.count;

    test('counter products', () {
      expect(count, equals(1));
    });
  });
}
