import 'package:flutter/material.dart';

/// 將網址的 `?lang=` 值轉成支援的 Locale；無法辨識時回傳 null。
Locale? localeFromQuery(String? lang) {
  switch (lang?.toLowerCase()) {
    case 'en':
      return const Locale('en');
    case 'jp':
    case 'ja':
      return const Locale('ja');
    case 'ch':
    case 'zh':
      return const Locale('zh');
    default:
      return null;
  }
}
