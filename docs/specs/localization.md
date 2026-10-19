# 多國語言

## 支援語言

中文 `zh`、英文 `en`、日文 `ja`；fallback 為中文。

- 介面文字：`assets/translations/{zh,en,ja}.json`
- 履歷內容：`lib/utils/constants.dart` 的 `resumeDataZh` / `resumeDataEn` / `resumeDataJa`，三份內容需保持同步。
- 日文使用 Noto Sans JP，其餘使用 Noto Sans TC。

## 顯示語言的決定順序

1. 網址 `?lang=` 有效 → 使用它
2. 曾在頁面切換過 → 使用已存的選擇
3. 瀏覽器語言
4. 中文

用途：投遞履歷時附上帶語言參數的連結，對方打開即看到該語言版本。網址只作為入口：頁面上切換語言時不回寫網址。

以網址指定的語言也會被存下，之後不帶參數再開仍是同一語言。非 Web 平台沒有網址參數，自然忽略。

## `?lang=` 對應（不分大小寫）

| `?lang=` | 語言 |
|---|---|
| `en` | 英文 |
| `jp`、`ja` | 日文 |
| `ch`、`zh` | 中文 |
| 其他值或未帶參數 | 忽略，依上方順序 |

對應規則在 `lib/utils/locale_from_query.dart`，套用在 `lib/main.dart`。

## 語言切換器

導覽列右側的「中文 / EN / JP」按鈕，目前語言以白底、粗體、主色標示。

## 測試

- `test/unit/locale_from_query_test.dart`
- `test/widget/url_locale_test.dart`
