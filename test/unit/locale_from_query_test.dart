import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resume/utils/locale_from_query.dart';

void main() {
  group('localeFromQuery', () {
    test('maps en to English', () {
      expect(localeFromQuery('en'), const Locale('en'));
    });

    test('maps jp and ja to Japanese', () {
      expect(localeFromQuery('jp'), const Locale('ja'));
      expect(localeFromQuery('ja'), const Locale('ja'));
    });

    test('maps ch and zh to Chinese', () {
      expect(localeFromQuery('ch'), const Locale('zh'));
      expect(localeFromQuery('zh'), const Locale('zh'));
    });

    test('is case-insensitive', () {
      expect(localeFromQuery('EN'), const Locale('en'));
      expect(localeFromQuery('Jp'), const Locale('ja'));
    });

    test('returns null for unknown, empty or missing value', () {
      expect(localeFromQuery('fr'), isNull);
      expect(localeFromQuery(''), isNull);
      expect(localeFromQuery(null), isNull);
    });
  });
}
