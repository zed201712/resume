import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resume/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('url locale overrides previously saved locale', (tester) async {
    HttpOverrides.global = null;

    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // 訪客之前切換過中文
    SharedPreferences.setMockInitialValues({'locale': 'zh'});
    await EasyLocalization.ensureInitialized();

    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale('zh'), Locale('en'), Locale('ja')],
        path: 'assets/translations',
        fallbackLocale: const Locale('zh'),
        child: const ResumeApp(urlLocale: Locale('ja')),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('スキル'), findsWidgets);
    expect(find.text('核心技術'), findsNothing);
  });
}
