import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:resume/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('mobile navbar shows icon buttons and language switcher', (tester) async {
    HttpOverrides.global = null;

    // 模擬手機寬度 375px
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();

    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale('zh'), Locale('en'), Locale('ja')],
        path: 'assets/translations',
        fallbackLocale: const Locale('zh'),
        child: const ResumeApp(),
      ),
    );
    await tester.pumpAndSettle();

    // 驗證 4 個 icon 按鈕出現（部分 icon 也出現在各 Section 標題中，故使用 findsWidgets）
    expect(find.byIcon(LucideIcons.user),       findsWidgets);
    expect(find.byIcon(LucideIcons.zap),        findsWidgets);
    expect(find.byIcon(LucideIcons.briefcase),  findsWidgets);
    expect(find.byIcon(LucideIcons.code),       findsWidgets);

    // 驗證語言切換器出現（找中文按鈕文字）
    expect(find.text('中文'), findsOneWidget);
  });
}
