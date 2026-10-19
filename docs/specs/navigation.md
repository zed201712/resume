# 導覽列

固定在頁面頂端（高 64，半透明白底）。左側為「Portfolio.」標誌，右側為導覽按鈕與[語言切換器](localization.md#語言切換器)。點擊導覽按鈕會平滑捲動（600ms）到對應區塊。

## 桌面（寬度 ≥ 768）

文字按鈕，順序：關於 → 經歷 → 技能 → 專案。

## 手機（寬度 < 768）

圖示按鈕（20px，Slate 600），順序：

| 圖示 | 區塊 |
|---|---|
| `user` | 關於（Hero） |
| `zap` | 技能 |
| `briefcase` | 經歷 |
| `code` | 專案 |

## 測試

- `test/widget/home_screen_mobile_test.dart`
