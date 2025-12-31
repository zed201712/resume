import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resume/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // 允許在測試中使用真實的 HTTP 請求，避免 NetworkImageLoadException (400)
    HttpOverrides.global = null;

    // 設定測試視窗大小為 1920x1080，模擬桌面環境以避免 overflow
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;

    // 測試結束後重置視窗大小
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // 初始化 SharedPreferences Mock，這是 EasyLocalization 所需的
    SharedPreferences.setMockInitialValues({});
    
    // 確保 EasyLocalization 已初始化
    await EasyLocalization.ensureInitialized();

    // 構建 App，並包裹在 EasyLocalization 中
    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale('zh'), Locale('en'), Locale('ja')],
        path: 'assets/translations',
        fallbackLocale: const Locale('zh'),
        child: const ResumeApp(),
      ),
    );

    // 等待本地化加載完成並重新構建
    await tester.pumpAndSettle();
  });
}
