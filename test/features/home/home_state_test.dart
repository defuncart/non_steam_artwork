import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:non_steam_artwork/features/home/home_state.dart';

void main() {
  group('convertContentLengthToDisplayString', () {
    final expectedResults = {
      null: isNull,
      '-1': isNull,
      '0': isNull,
      '1': '1 B',
      '100': '100 B',
      '1000': '1000 B',
      '1024': '1 KB',
      '${pow(1024, 2)}': '1 MB',
      '${pow(1024, 3)}': '1 GB',
      '${pow(1024, 4)}': '1024 GB',
    };

    for (final kvp in expectedResults.entries) {
      final testValue = kvp.key;
      final expectedResult = kvp.value;

      test('when $testValue, expect $expectedResult', () {
        expect(convertContentLengthToDisplayString(testValue), expectedResult);
      });
    }
  });
}
