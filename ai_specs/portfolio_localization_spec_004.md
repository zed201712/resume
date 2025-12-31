## AI 專案任務指示文件 (Feature Task)

| 區塊 | 內容                                  |
|:---|:------------------------------------|
| **任務 ID (Task ID)** | `FEAT-PORTFOLIO-LOCALIZATION-004`   |
| **標題 (Title)** | `ADD JAPANESE LOCALIZATION SUPPORT` |
| **創建日期 (Date)** | `2025/12/31`                        |
| **目標版本 (Target Version)** | `1.2.0`                             |
| **專案名稱 (Project)** | `resume`                            |

---

### **Section 1: 核心任務定義 (Core Task Definition)**

#### **1.1 任務目標 (Goal)** **【必填】**

*   **說明：** 在現有的中英文基礎上，新增日文 (Japanese) 語言支援。
*   **目的：**
    1.  **擴大受眾 (Audience Expansion)：** 針對日本市場或日語使用者展示作品集。
    2.  **多語言架構驗證 (Validation)：** 驗證目前的 `easy_localization` 與 `LanguageProvider` 架構是否能輕鬆擴充第三種語言。
    3.  **字型優化 (Typography)：** 確保日文顯示使用正確的漢字字形 (Glyphs)。

#### **1.2 詳細需求 (Detailed Requirements)** **【必填】**

1.  **資源檔設定 (Resources Setup)**
    *   新增 `assets/translations/ja.json`，內容結構需與 `en.json` 和 `zh.json` 完全一致，並填入對應的日文翻譯。

2.  **資料模型擴充 (Data Expansion)**
    *   在 `lib/utils/constants.dart` 中新增 `const resumeDataJa = ResumeData(...)`。
    *   內容包含：職稱 (Senior Full Stack Engineer -> シニアフルスタックエンジニア)、簡介、技能列表、工作經歷與專案內容的日文版。

3.  **狀態管理 (State Management)**
    *   更新 `lib/providers/language_provider.dart`：
    *   修改 `getResumeData(BuildContext context)` 方法，增加對 `ja` 語言代碼的判斷，回傳 `resumeDataJa`。

4.  **UI 整合與優化 (UI Integration & Optimization)**
    *   **Main Entry (`main.dart`):**
        *   更新 `EasyLocalization` 的 `supportedLocales` 加入 `Locale('ja')`。
        *   **字型切換：** 由於 `Noto Sans TC` (繁體中文) 與日文漢字寫法不同 (例如「直」、「海」)，需在 `MaterialApp` 的 `theme` 中動態切換字型。
        *   若 `context.locale.languageCode == 'ja'`，使用 `GoogleFonts.notoSansJp`。
    *   **Language Switcher:**
        *   在 `PortfolioHomePage` 的導航列語言選單中，新增 "日本語" 選項。

---

### **Section 2: 技術細節與範圍 (Technical Scope & Constraints)**

#### **2.1 受影響/新增的檔案清單 (Affected Files)** **【必填】**

*   **新增：** `assets/translations/ja.json`
*   **修改：** `lib/utils/constants.dart` (Add `resumeDataJa`)
*   **修改：** `lib/providers/language_provider.dart` (Handle 'ja' case)
*   **修改：** `lib/main.dart` (Add supported locale & Font switching logic)
*   **修改：** `lib/ui/screens/home_screen.dart` (Update Language Switcher UI)
*   **設定：** `pubspec.yaml` (Ensure `google_fonts` is updated if needed, though usually included)

#### **2.2 程式碼風格 (Style)**

*   **JSON Keys:** 保持與現有 `en.json` 完全一致，確保切換時不會出現 Key Missing 警告。
*   **Dart:** 遵循 `effective_dart`，使用 `const` 建構子優化效能。

---

### **Section 3: 驗證與輸出 (Verification & Output)**

#### **3.1 驗證步驟 (Verification Steps)**

1.  **切換測試：** 啟動 App，點擊導航列切換至 "日本語"。
2.  **文字檢查：**
    *   UI 標籤 (導航、按鈕) 是否顯示為日文？
    *   履歷資料 (技能、經歷) 是否顯示為日文？
3.  **字型檢查：** 確認漢字顯示是否符合日文規範 (例如「骨」、「直」的筆畫)。
4.  **Layout:** 檢查日文較長的片假名是否導致 UI 溢出 (Overflow)。

---

### **Section 4: Commit 程式碼分析與審查 (Analysis & Review)**

#### **4.1 邏輯檢查與改善建議 (Logical Errors & Improvements)**

*   **字型問題 (Font Rendering):**
    *   **風險：** 僅使用 `Noto Sans TC` 渲染日文會導致「Han Unification」問題，部分漢字會顯示為繁體中文寫法，對日文使用者來說看起來會很奇怪（甚至被視為錯字）。
    *   **改善：** 必須在 `main.dart` 實作字型切換邏輯。
    *   **Code Hint:**
        