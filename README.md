# resume

我的個人網站：介紹我的背景、技術能力、工作經歷，以及部分作品。

**線上版本：<https://zed201712.github.io/resume/>**

本專案以 Flutter 開發，編譯成 Web 後部署在 GitHub Pages。頁面支援繁體中文、English、日本語三種語言，並依螢幕寬度切換桌面與行動版佈局。

## 功能

| 區塊 | 內容 | 檔案 |
| --- | --- | --- |
| Hero | 個人簡介、照片、社群連結 | [`hero_section.dart`](lib/ui/widgets/sections/hero_section.dart) |
| Skills | 依類別分組的技術能力 | [`skills_section.dart`](lib/ui/widgets/sections/skills_section.dart) |
| Experience | 以時間軸呈現的工作經歷 | [`experience_section.dart`](lib/ui/widgets/sections/experience_section.dart) |
| Projects | 作品卡片，含縮圖、描述、技術標籤與連結 | [`projects_section.dart`](lib/ui/widgets/sections/projects_section.dart) |

## 取得程式碼

```bash
git clone https://github.com/zed201712/resume.git
cd resume
```

## 環境需求

| 工具 | 版本 | 說明 |
| --- | --- | --- |
| [Flutter SDK](https://docs.flutter.dev/get-started/install) | 3.35.7（stable） | 與 [CI](.github/workflows/flutter_deploy.yaml) 使用的版本相同 |
| Chrome | 最新版 | 本機執行 Web 版用 |

專案沒有使用 FVM 等版本鎖定工具。CI 固定用 Flutter 3.35.7 建置；本機使用相同版本，可以避免「本機能跑、部署時才失敗」的狀況（`pubspec.lock` 不在版本庫，依賴版本會依 SDK 重新解析）。

確認安裝：

```bash
flutter --version   # 應顯示 Flutter 3.35.7
flutter doctor
```

## 本機開發

```bash
flutter pub get
flutter run -d chrome
```

### 修改內容

| 要改的東西 | 位置 |
| --- | --- |
| 履歷資料（簡介、技能、經歷、作品），每種語言一份 | [`lib/utils/constants.dart`](lib/utils/constants.dart)（`resumeDataZh` / `resumeDataEn` / `resumeDataJa`） |
| 介面文字（導覽列、標題、按鈕） | [`assets/translations/`](assets/translations/)（`zh.json` / `en.json` / `ja.json`） |
| 圖片 | [`assets/images/`](assets/images/)；作品圖片也可以用 `http(s)` 網址 |

新增或修改文字時，三種語言要一起更新。

## 測試與建置

```bash
flutter test       # 執行所有測試
flutter analyze    # 靜態分析
```

建置正式版 Web（與 CI 相同的指令）：

```bash
flutter build web --release --base-href /resume/
```

產出在 `build/web/`。`--base-href` 必須和 GitHub Pages 的子路徑（repo 名稱）一致，否則資源路徑會錯、頁面會空白。
