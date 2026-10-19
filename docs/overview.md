# 專案概述

以 Flutter 開發的個人履歷 / 作品集網站，支援中、英、日三種語言，主要部署為 Web。

## 功能與對應檔案

| 功能 | 用途 | 對應檔案 |
|---|---|---|
| 首頁框架 | 導覽列、語言切換、整體佈局與頁尾 | `lib/ui/screens/home_screen.dart` |
| Hero | 問候語、職稱、自我介紹、照片 | `lib/ui/widgets/sections/hero_section.dart` |
| 工作經歷 | 以時間軸呈現職涯歷程 | `lib/ui/widgets/sections/experience_section.dart` |
| 技術棧 | 依類別分組的技能 | `lib/ui/widgets/sections/skills_section.dart` |
| 專案展示 | 作品卡片網格，點擊開啟專案連結 | `lib/ui/widgets/sections/projects_section.dart` |
| 聯絡資訊 | 目前未顯示（首頁中已註解） | `lib/ui/widgets/sections/contact_section.dart` |
| AI 助手 | 僅為 Mock，目前未顯示 | `lib/ui/widgets/ai_assistant_widget.dart` |

首頁區塊由上而下：Hero → 工作經歷 → 技術棧 → 專案展示 → 頁尾。

## 架構

分三層，依賴單向：**UI → Provider → Model**。

```text
UI          HomeScreen ─► Sections (Hero, Experience, Skills, Projects)
             │
Provider    LanguageProvider（依目前語言回傳對應的 ResumeData）
             │
Model       ResumeData / Skill / Experience / Project（resume_model.dart）
Data        resumeDataZh / resumeDataEn / resumeDataJa（lib/utils/constants.dart）
```

- **UI**：只負責呈現與捕捉操作，透過 Provider 取得資料。
- **Provider**：`LanguageProvider` 依 `context.locale` 選出該語言的 `ResumeData`。
- **Model**：純資料結構，不依賴 UI 框架。

## 資料流

1. 啟動時 easy_localization 決定顯示語言（規則見 [localization.md](specs/localization.md)）。
2. 各區塊 `watch` `LanguageProvider`，取得該語言的 `ResumeData` 渲染。
3. 介面固定文字來自 `assets/translations/{zh,en,ja}.json`；履歷內容來自 `constants.dart` 的三份 `ResumeData`。

## 限制

- **AI 助手**：`AiAssistantWidget` 與 `ChatProvider` 只是 Mock，不讀履歷資料、不呼叫 API。除非使用者明確要求，不規劃或檢查其功能。

## 文件索引

| 文件 | 說明 |
|---|---|
| [specs/localization.md](specs/localization.md) | 支援語言、顯示語言的決定順序、網址 `?lang=` 參數 |
| [specs/navigation.md](specs/navigation.md) | 導覽列在桌面與手機的呈現、區塊跳轉 |
| [specs/hero.md](specs/hero.md) | 問候語模板、三段自我介紹與跳轉按鈕 |
| [specs/projects.md](specs/projects.md) | 專案卡片網格、圖片來源、點擊行為 |
