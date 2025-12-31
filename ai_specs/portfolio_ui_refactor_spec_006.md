## AI 專案任務指示文件 (Feature Task)

| 區塊 | 內容 |
|:---|:---|
| **任務 ID (Task ID)** | `FEAT-PORTFOLIO-UI-REFACTOR-006` |
| **標題 (Title)** | `REFACTOR UI COMPONENTS AND ADD DEPLOY WORKFLOW` |
| **創建日期 (Date)** | `2025/12/31` |
| **目標版本 (Target Version)** | `1.1.2` |
| **專案名稱 (Project)** | `resume` |

---

### **Section 1: 核心任務定義 (Core Task Definition)**

#### **1.1 任務目標 (Goal)** **【必填】**

*   **說明：** 根據 commit `1b7ff956` 的變更內容，對專案進行 UI 重構與部署流程的設定。
*   **目的：**
    1.  **UI 優化 (UI Improvement)：** 重構 `HeroSection`，替換靜態圖片為本地資源 (`prof_image.png`)，調整佈局以更好地適應不同螢幕尺寸。
    2.  **組件抽離 (Component Extraction)：** 將 `SocialButton` 從 `HeroSection` 中獨立出來，提升程式碼復用性。
    3.  **自動化部署 (CI/CD)：** 建立 GitHub Actions workflow (`flutter_deploy.yaml`) 以自動化建置與部署流程。
    4.  **內容更新 (Content Update)：** 微調翻譯檔與 `constants.dart` 中的資料，確保資訊準確。

#### **1.2 詳細需求 (Detailed Requirements)** **【必填】**

1.  **UI 重構 (UI Refactoring)**
    *   **`lib/ui/widgets/sections/hero_section.dart`:**
        *   大幅簡化佈局結構。
        *   移除舊的旋轉背景裝飾與複雜的 `Stack` 結構。
        *   改為使用 `CircleAvatar` 或圓形裁切的 `Image.asset` 來顯示頭像。
        *   引用路徑：`assets/images/prof_image.png`。
        *   調整文字樣式與間距，使其更簡潔現代。
        *   使用新抽離的 `SocialButton`。
    *   **`lib/ui/widgets/social_button.dart` (New):**
        *   建立一個獨立的 `SocialButton` Widget。
        *   接收 `IconData` 與 `onPressed` (或 `url`) 作為參數。
        *   樣式統一管理，方便後續維護。
    *   **`lib/ui/screens/home_screen.dart`:**
        *   配合 `HeroSection` 的改動進行微調。
        *   可能涉及 Padding 或 Layout 的調整。

2.  **資源與設定 (Assets & Configuration)**
    *   **`pubspec.yaml`:**
        *   確保 `assets/images/` 路徑已被宣告。
        *   新增 `url_launcher` 依賴 (若尚未存在，用於 Social Button)。
    *   **`assets/images/prof_image.png`:**
        *   需確認圖片檔案存在於專案中 (Binary file)。

3.  **自動化流程 (CI/CD Workflow)**
    *   **`.github/workflows/flutter_deploy.yaml` (New):**
        *   建立 GitHub Actions workflow。
        *   觸發條件：`push` to `main` branch。
        *   Job 步驟：
            *   Checkout code。
            *   Setup Flutter environment。
            *   `flutter pub get`。
            *   `flutter build web`。
            *   Deploy to GitHub Pages (使用 `peaceiris/actions-gh-pages` 或類似 action)。

4.  **資料與翻譯 (Data & Localization)**
    *   **`lib/utils/constants.dart`:**
        *   同步更新 `ResumeData` 的欄位或內容 (依據 commit 變更)。
        *   確保 `resumeDataZh`, `resumeDataEn`, `resumeDataJa` 的一致性。
    *   **`assets/translations/*.json`:**
        *   更新部分翻譯字串 (en/zh)，修正語意或格式。

---

### **Section 2: 技術細節與範圍 (Technical Scope & Constraints)**

#### **2.1 受影響/新增的檔案清單 (Affected Files)** **【必填】**

*   **新增：** `.github/workflows/flutter_deploy.yaml`
*   **新增：** `lib/ui/widgets/social_button.dart`
*   **新增：** `assets/images/prof_image.png` (Binary)
*   **修改：** `lib/ui/widgets/sections/hero_section.dart`
*   **修改：** `lib/ui/screens/home_screen.dart`
*   **修改：** `lib/utils/constants.dart`
*   **修改：** `pubspec.yaml`
*   **修改：** `assets/translations/en.json`, `assets/translations/zh.json`
*   **修改：** `lib/main.dart` (Minor adjustment)

#### **2.2 程式碼風格 (Style)**

*   **Widget Structure:** 保持 Widget 的 `const` 建構子。
*   **Imports:** 優先使用相對路徑引用專案內檔案。
*   **Layout:** 使用 `Flex`, `Row`, `Column` 搭配 `Expanded` 處理響應式佈局。

---

### **Section 3: 驗證與輸出 (Verification & Output)**

#### **3.1 驗證步驟 (Verification Steps)**

1.  **UI 檢查：**
    *   執行 `flutter run -d chrome`。
    *   確認 Hero Section 的大頭貼是否正確顯示 (`prof_image.png`)。
    *   確認 Social Buttons 點擊是否能正確跳轉。
    *   檢查手機版與桌面版的佈局是否正常。
2.  **建置測試：**
    *   執行 `flutter build web --release` 確認建置無誤。
3.  **GitHub Actions：**
    *   (若有權限) Push 至 GitHub 後，觀察 Action 是否成功執行並部署。

---

### **Section 4: Commit 程式碼分析與審查 (Analysis & Review)**

#### **4.1 潛在影響**

*   **圖片資源：** 若 `prof_image.png` 檔案過大，可能影響首次加載速度，建議優化圖片大小。
*   **部署設定：** GitHub Pages 部署需確認 Base HREF 設定是否正確 (通常需在 build 時加上 `--base-href` 參數)。

#### **4.2 提交訊息 (Commit Message)**

```text
refactor(ui): redesign hero section and add deploy workflow

- Extract SocialButton widget for better reusability
- Update HeroSection with local profile image and simplified layout
- Add GitHub Actions workflow for automated web deployment
- Update constants.dart and translation files
- Ensure assets configuration in pubspec.yaml

Task-ID: FEAT-PORTFOLIO-UI-REFACTOR-006
```
