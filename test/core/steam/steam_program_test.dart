import 'package:flutter_test/flutter_test.dart';
import 'package:non_steam_artwork/core/steam/steam_program.dart';

void main() {
  group('fromJson', () {
    test('when data is valid, expect correctly deserialized', () {
      const jsonData = {
        'nVersion': 1,
        'logoPosition': {'pinnedPosition': 'BottomLeft', 'nWidthPct': 50.0, 'nHeightPct': 50.0},
      };

      expect(
        LogoPositionUtils.fromJson(jsonData),
        const LogoPosition(position: LogoPositionType.bottomLeft, width: 50, height: 50),
      );
    });

    test('when width is double and height int, expect correctly deserialized', () {
      const jsonData = {
        'nVersion': 1,
        'logoPosition': {'pinnedPosition': 'BottomLeft', 'nWidthPct': 50.0, 'nHeightPct': 50},
      };

      expect(
        LogoPositionUtils.fromJson(jsonData),
        const LogoPosition(position: LogoPositionType.bottomLeft, width: 50, height: 50),
      );
    });

    test('when position is invalid, expect error thrown', () {
      const jsonData = {
        'nVersion': 1,
        'logoPosition': {'pinnedPosition': 'bla', 'nWidthPct': 50.0, 'nHeightPct': 50},
      };

      expect(() => LogoPositionUtils.fromJson(jsonData), throwsA(isA<ArgumentError>()));
    });

    test('when width is string, expect error thrown', () {
      const jsonData = {
        'nVersion': 1,
        'logoPosition': {'pinnedPosition': 'BottomLeft', 'nWidthPct': '50.0', 'nHeightPct': 50},
      };

      expect(() => LogoPositionUtils.fromJson(jsonData), throwsA(isA<TypeError>()));
    });

    test('when height is string, expect error thrown', () {
      const jsonData = {
        'nVersion': 1,
        'logoPosition': {'pinnedPosition': 'BottomLeft', 'nWidthPct': 50.0, 'nHeightPct': '50'},
      };

      expect(() => LogoPositionUtils.fromJson(jsonData), throwsA(isA<TypeError>()));
    });

    test('when json is invalid , expect error thrown', () {
      const jsonData = {'nVersion': 1};

      expect(() => LogoPositionUtils.fromJson(jsonData), throwsA(isA<NoSuchMethodError>()));
    });

    test('when position is missing, expect error thrown', () {
      const jsonData = {
        'nVersion': 1,
        'logoPosition': {'nWidthPct': 50.0, 'nHeightPct': 50},
      };

      expect(() => LogoPositionUtils.fromJson(jsonData), throwsA(isA<TypeError>()));
    });

    test('when width is missing, expect error thrown', () {
      const jsonData = {
        'nVersion': 1,
        'logoPosition': {'pinnedPosition': 'BottomLeft', 'nHeightPct': 50},
      };

      expect(() => LogoPositionUtils.fromJson(jsonData), throwsA(isA<TypeError>()));
    });

    test('when height is missing, expect error thrown', () {
      const jsonData = {
        'nVersion': 1,
        'logoPosition': {'pinnedPosition': 'BottomLeft', 'nWidthPct': 50.0},
      };

      expect(() => LogoPositionUtils.fromJson(jsonData), throwsA(isA<TypeError>()));
    });
  });
}
