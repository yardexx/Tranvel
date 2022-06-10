import 'package:flutter_test/flutter_test.dart';
import 'package:trainvel/result/result.dart';

void main() {
  test('Dummy test', () {
    expect(
      const Carrier(fullName: 'Lorem', shortName: 'Ipsum', url: 'Dolor'),
      isA<Carrier>(),
    );
  });
}
