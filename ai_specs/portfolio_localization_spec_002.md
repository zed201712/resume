## AI 專案任務指示文件 (Feature Task)

| 區塊 | 內容 |
|:---|:---|
| **任務 ID (Task ID)** | `FEAT-PORTFOLIO-LOCALIZATION-002` |
| **標題 (Title)** | `ADD EASY_LOCALIZATION SUPPORT` |
| **創建日期 (Date)** | `2025/12/30` |
| **目標版本 (Target Version)** | `1.1.0` |
| **專案名稱 (Project)** | `resume` |

---

### **Section 1: 核心任務定義 (Core Task Definition)**

#### **1.1 任務目標 (Goal)** **【必填】**

*   **說明：** 為 Flutter Web 專案加入 `easy_localization` 支援，並實作中英文切換功能。
*   **目的：**
    1.  **多語言支援 (Multi-language Support)：** 讓作品集能夠觸及英語系國家的受眾或雇主。
    2.  **工具選擇 (Tooling)：** 使用 `easy_localization` 套件來簡化翻譯檔案管理與切換邏輯。
    3.  **狀態管理 (State Management)：** 雖然 `easy_localization` 處理了語言狀態，但仍需使用 `LanguageProvider` (或其他 Provider 機制) 來管理與語言相關的**資料模型** (`ResumeData`) 切換。
    4.  **內容翻譯 (Translation)：** 將現有的靜態文字 (UI Labels) 與履歷資料 (Resume Content) 進行英文翻譯。

#### **1.2 詳細需求 (Detailed Requirements)** **【必填】**

1.  **依賴設定 (Dependencies Setup)**
    *   在 `pubspec.yaml` 加入 `easy_localization` 套件。
    *   在 `pubspec.yaml` 的 `assets` 區塊中宣告翻譯檔案路徑 `assets/translations/`。

2.  **狀態管理 (State Management)**
    *   **Locale State:** 由 `easy_localization` 負責 (`EasyLocalization` Widget)。
    *   **Data State (`LanguageProvider` with `ChangeNotifier`):**
        *   **目的:** 解決 `ResumeData` 這種複雜物件無法放入 JSON 翻譯檔的問題。
        *   **State:** 無需自行儲存 Locale (依賴 `context.locale`)，但需提供方法獲取當前資料。
        *   **Getters:** `ResumeData getResumeData(BuildContext context)`: 根據 `context.locale` 回傳 `resumeDataZh` 或 `resumeDataEn`。
        *   **註記:** 建議建立一個簡單的 Provider 來封裝資料獲取邏輯。

3.  **翻譯實作 (Translation Implementation)**
    *   **UI 字串 (Static UI Strings):** 使用 JSON 檔案管理 (`assets/translations/en.json`, `assets/translations/zh.json`)。
        *   包含：導航選單 ("About", "Skills"), 章節標題, 按鈕文字 ("Contact Me", "Send").
        *   使用方式: `"key".tr()`。
    *   **履歷資料 (Resume Content):**
        *   在 `lib/utils/constants.dart` 中擴充資料結構。
        *   保留原有的 `resumeData` 作為中文版 (`resumeDataZh`)。
        *   新增 `resumeDataEn`，包含所有欄位的英文翻譯。
        *   UI 層透過 `context.read<LanguageProvider>().getResumeData(context)` 或類似機制獲取。

4.  **UI 整合 (UI Integration)**
    *   **`main.dart`:**
        *   呼叫 `WidgetsFlutterBinding.ensureInitialized()` 與 `EasyLocalization.ensureInitialized()`。
        *   使用 `EasyLocalization` Widget 包裹 `ResumeApp`，設定 `supportedLocales` (`[Locale('zh'), Locale('en')]`) 與 `path`。
        *   `MaterialApp` 需設定 `localizationsDelegates` 與 `supportedLocales` (從 `context` 獲取)。
    *   **`PortfolioHomePage` (NavBar):** 新增語言切換按鈕，點擊呼叫 `context.setLocale(Locale('en'))` 或 `context.setLocale(Locale('zh'))`。
    *   **各個 Section Widgets:** 將寫死的 String 改為 `"stringKey".tr()`，資料部分透過 Provider 獲取。

---

### **Section 2: 技術細節與範圍 (Technical Scope & Constraints)**

#### **2.1 受影響/新增的檔案清單 (Affected Files)** **【必填】**

*   **設定檔：** `pubspec.yaml` (Dependencies & Assets)
*   **資源檔：** `assets/translations/en.json` (New), `assets/translations/zh.json` (New)
*   **Provider：** `lib/providers/language_provider.dart` (New)
*   **修改：** `lib/main.dart` (Init EasyLocalization)
*   **修改：** `lib/utils/constants.dart` (Add `resumeDataEn`)
*   **修改：** `lib/ui/screens/home_screen.dart` (NavBar Switcher)
*   **修改：** `lib/ui/widgets/sections/*.dart` (Replace Strings)
*   **修改：** `lib/ui/widgets/ai_assistant_widget.dart` (Multilingual welcome message)

#### **2.2 程式碼風格 (Style)**

*   **Localization Key:** JSON key 使用 `camelCase` (e.g., `"navAbout": "About"`).
*   **Provider:** 遵循 `ChangeNotifier`。

---

### **Section 3: 驗證與輸出 (Verification & Output)**

#### **3.1 驗證步驟 (Verification Steps)**

1.  **依賴安裝：** 執行 `flutter pub get`。
2.  **語言切換測試：**
    *   啟動 App，預設應為中文 (若系統語言為中文) 或設定的 fallback。
    *   點擊 NavBar 切換按鈕。
    *   確認 `"navAbout".tr()` 等字串正確變更。
    *   確認 `resumeData` 內容變更。
3.  **Hot Restart:** 確認在 Hot Restart 後語言設定能保持 (EasyLocalization 預設會儲存偏好)。

---

### **Section 4: Commit 程式碼分析與審查 (Analysis & Review)**

#### **4.1 潛在影響分析**

*   **Assets 設定:** 必須確保 `pubspec.yaml` 正確宣告 `assets/translations/`，否則會報錯 `Asset not found`。
*   **Context 依賴:** `easy_localization` 高度依賴 `context`，在非 Widget 環境 (如純邏輯類) 使用翻譯需小心。

#### **4.2 審查結論**
*   使用 `easy_localization` 大幅簡化了設定流程 (不需 ARB 生成)，且 JSON 格式對非開發者也較友善。


#### **4.3 提交訊息 (Commit Message)**

```text
feat: add easy_localization support

- Add easy_localization dependency and configure assets
- Implement LanguageProvider for switching ResumeData based on locale
- Create JSON translation files (en.json, zh.json)
- Update constants.dart with localized resume data (resumeDataZh, resumeDataEn)
- Refactor UI components to use tr() and provider data
- Add locale switch button to PortfolioHomePage

Task-ID: FEAT-PORTFOLIO-LOCALIZATION-002
```