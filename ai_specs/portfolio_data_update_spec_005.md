## AI 專案任務指示文件 (Feature Task)

| 區塊 | 內容                                     |
|:---|:---------------------------------------|
| **任務 ID (Task ID)** | `FEAT-PORTFOLIO-DATA-UPDATE-005`       |
| **標題 (Title)** | `UPDATE RESUME DATA WITH REAL PROFILE` |
| **創建日期 (Date)** | `2025/12/31`                           |
| **目標版本 (Target Version)** | `1.1.1`                                |
| **專案名稱 (Project)** | `resume`                               |

---

### **Section 1: 核心任務定義 (Core Task Definition)**

#### **1.1 任務目標 (Goal)** **【必填】**

*   **說明：** 將 `lib/utils/constants.dart` 中的範例履歷資料更新為使用者的真實資料，並支援多語言（中/英/日）。
*   **目的：**
    1.  **真實性 (Authenticity)：** 替換假資料，展示使用者在 iOS/Android/Server 端開發的真實經歷。
    2.  **多語言同步 (Multi-language Sync)：** 基於提供的中文資料，同步產生英文 (En) 與日文 (Ja) 版本的資料。
    3.  **狀態管理 (State Management)：** 確保資料更新後，能透過 `Provider` (如 `LanguageProvider`) 正確流向 UI。

#### **1.2 詳細需求 (Detailed Requirements)** **【必填】**

1.  **資料更新 (Data Update)**
    *   **檔案：** `lib/utils/constants.dart`
    *   **對象：** `resumeDataZh` (Primary), `resumeDataEn`, `resumeDataJa`
    *   **基本資料 (Profile)：**
        *   **Name:** 若無提供則保留預設或使用 "TBD"。
        *   **Bio (Zh):**
            *   "台灣宜蘭出身, 2024年取得日本國籍。"
            *   "資訊工程系畢業, 在BIOS開發一年後, 轉換跑道進行App開發。"
            *   "此後8年期間 在iOS（Swift + UIKit / SwiftUI）開發累積相關經驗。以及3年的Android相關開發經驗。"
            *   "在目前的工作在職７年, 專案的程式碼行數１５萬左右, 負責開發 / 維護, 精通從整體架構的理解到細節的實作。"
            *   "雖然主要負責前端開發。 但也負責的後端部分開發, 使用PHP / Oracle 資料庫的開發 / 測試。"
            *   "擁有理解並設計開發整體系統的相關經驗。"
        *   **Bio (En/Ja):** 翻譯上述內容，保持專業語氣。
    *   **技能 (Skills)：**
        *   **Languages:** Swift (7年), Objective-C (1年), PHP (3年), Java (5年), Kotlin (3年), Bash Script (1年).
        *   **Frameworks:** UIKit (8年), SwiftUI (2年), Flutter (3個月), iOS (8年), Android (3年).
        *   **Tools:** Git, GitLab, DeployGate, CocoaPods, XCode, Android Studio, PhpStorm, Asana, Figma, Mattermost.
        *   **Level Calculation:** 依據年資轉換為百分比 (e.g., 8y=95, 1y=60, 3mo=40)。
    *   **工作經歷 (Experiences)：**
        *   **Exp 1 (Current):** アイベック (株) (2018/06 - 2025/12)
            *   **Role:** iOS/Android/Server Engineer (需翻譯)
            *   **Details:** iOS App (Swift, UIKit, SwiftUI), Android App (Java/Kotlin), Server App (PHP, Oracle DB). Git version control, Code review, Collaboration.
        *   **Exp 2:** 三臻企業有限公司 (2016/09 - 2017/10)
            *   **Role:** iOS Developer
            *   **Details:** Web Camera App. Objective-C/UIKit. UI Implementation, Debug, Server connection.
        *   **Exp 3:** insyde (2015/05 - 2016/05)
            *   **Role:** BIOS/UEFI Firmware Developer
            *   **Details:** C Language. BIOS boot process knowledge. Code analysis, feature modification, Debug.
    *   **專案 (Projects)：**
        *   由於未提供獨立專案，需將工作經歷中的重點轉化為專案展示，或保留結構待填。建議建立以下專案項目：
            *   **Project 1:** "iOS/Android Integrated System" (Based on Ibex experience). Tags: Swift, Kotlin, PHP.
            *   **Project 2:** "Web Camera Controller" (Based on San Zhen experience). Tags: Objective-C, UIKit.
            *   **Project 3:** "UEFI BIOS Firmware" (Based on Insyde experience). Tags: C, Assembly.
        *   圖片：使用 Lorem Picsum 佔位符。

2.  **翻譯實作 (Translation)**
    *   利用 AI 翻譯生成 `resumeDataEn` 與 `resumeDataJa`。
    *   注意專有名詞 (BIOS, UEFI, UIKit, SwiftUI) 不應翻譯。

---

### **Section 2: 技術細節與範圍 (Technical Scope & Constraints)**

#### **2.1 受影響/新增的檔案清單 (Affected Files)** **【必填】**

*   **修改：** `lib/utils/constants.dart` (Data content only)

#### **2.2 程式碼風格 (Style)**

*   遵循 `effective_dart`。
*   保持 `const` 建構子使用。
*   List 結尾加上逗號以保持格式整齊。

---

### **Section 3: 驗證與輸出 (Verification & Output)**

#### **3.1 驗證步驟 (Verification Steps)**

1.  **資料完整性：** 確認所有年資、技能、工具皆已列入。
2.  **多語言檢查：** 切換語言，確認 Bio 與 Experience 內容正確變更。
3.  **UI 呈現：** 確認長文字 (Bio) 在手機版面不會溢出或顯示異常。

---

### **Section 4: Commit 程式碼分析與審查 (Analysis & Review)**

#### **4.1 潛在影響**

*   **圖片缺乏：** 真實專案缺乏圖片可能影響作品集視覺效果，建議後續補充截圖或使用更相關的 icon/illustration。
*   **隱私注意：** 確認公司名稱與專案細節是否可公開 (目前假設已去敏或可公開)。

#### **4.2 提交訊息 (Commit Message)**

```text
chore(data): update resume data with real profile info

- Update constants.dart with real work experiences and skills
- Translate profile to English and Japanese
- Map skills to ResumeData structure with estimated levels
- Use placeholders for project images

Task-ID: FEAT-PORTFOLIO-DATA-UPDATE-005
```
