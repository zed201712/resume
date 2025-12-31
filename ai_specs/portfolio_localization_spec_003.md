## AI 專案任務指示文件 (Feature Task)

| 區塊 | 內容                                |
|:---|:----------------------------------|
| **任務 ID (Task ID)** | `FEAT-PORTFOLIO-LOCALIZATION-003` |
| **標題 (Title)** | `LOCALIZE REMAINING SECTIONS`     |
| **創建日期 (Date)** | `2025/12/31`                      |
| **目標版本 (Target Version)** | `1.1.0`                           |
| **專案名稱 (Project)** | `resume`                          |

---

### **Section 1: 核心任務定義 (Core Task Definition)**

#### **1.1 任務目標 (Goal)** **【必填】**

*   **說明：** 將多語言支援擴展至 `SkillsSection`, `ExperienceSection`, `ProjectsSection`, 與 `ContactSection`。
*   **目的：**
    1.  **全面中文化/英文化 (Full Localization)：** 確保首頁除了 Hero 區塊外，所有內容皆能根據語系切換。
    2.  **資料一致性 (Data Consistency)：** 所有 Section 皆需透過 `LanguageProvider` 獲取對應語系的 `ResumeData`。
    3.  **UI 文字抽離 (UI Strings)：** 將寫死的 UI 標籤 (如 "工作經歷", "發送訊息") 抽離至 JSON 翻譯檔。

#### **1.2 詳細需求 (Detailed Requirements)** **【必填】**

1.  **Skills Section (`skills_section.dart`)**
    *   **UI Strings:** 標題 "核心技術棧" (`skillsTitle`)、圖表標題 "技術掌握度" (`skillsChartTitle`)。
    *   **Categories:** 類別名稱 ('Frontend', 'Backend', 'Tools', 'Soft Skills') 需透過 `tr()` 翻譯 (key 建議: `skillCategoryFrontend`, etc.)。
    *   **Data Access:** 使用 `context.watch<LanguageProvider>().getResumeData(context)` 替換直接引用的 `resumeData`。
    *   **Refactor:** `_SkillsChartVertical` 需改為接受參數傳入資料，或在內部正確使用 Provider。

2.  **Experience Section (`experience_section.dart`)**
    *   **UI Strings:** 標題 "工作經歷" (`experienceTitle`)。
    *   **Data Access:** 透過 Provider 獲取 `resumeData.experiences`。

3.  **Projects Section (`projects_section.dart`)**
    *   **UI Strings:** 標題 "精選專案" (`projectsTitle`)、按鈕 "查看詳情" (`projectButtonView`)。
    *   **Data Access:** 透過 Provider 獲取 `resumeData.projects`。

4.  **Contact Section (`contact_section.dart`)**
    *   **UI Strings:** 標題 "取得聯繫" (`contactTitle`)、副標題 "準備好開始新專案了嗎？" (`contactSubtitle`)、描述文字 (`contactDescription`)、欄位標籤 ("EMAIL ME", "LOCATION", "姓名", "您的需求")、提示文字 (Placeholder)、按鈕 "發送訊息" (`contactButtonSend`)。
    *   **Data Access:** 透過 Provider 獲取 `resumeData.email`, `resumeData.location`。

5.  **Translation Files (`assets/translations/*.json`)**
    *   新增上述所有 UI 字串的對應 Key-Value (英/中)。

---

### **Section 2: 技術細節與範圍 (Technical Scope & Constraints)**

#### **2.1 受影響/新增的檔案清單 (Affected Files)** **【必填】**

*   **資源檔：** `assets/translations/en.json`, `assets/translations/zh.json` (Add new keys)
*   **修改：** `lib/ui/widgets/sections/skills_section.dart`
*   **修改：** `lib/ui/widgets/sections/experience_section.dart`
*   **修改：** `lib/ui/widgets/sections/projects_section.dart`
*   **修改：** `lib/ui/widgets/sections/contact_section.dart`
*   **修改：** `lib/utils/constants.dart` (Deprecate global `resumeData`)

#### **2.2 程式碼風格 (Style)**

*   **JSON Keys:** 使用 `camelCase`，建議加上前綴以區分區塊，例如 `skillsTitle`, `contactButtonSend`。
*   **Provider Usage:** 使用 `context.watch` 監聽變化，確保語言切換時 UI 即時更新。

---

### **Section 3: 驗證與輸出 (Verification & Output)**

#### **3.1 驗證步驟 (Verification Steps)**

1.  **語言切換：** 在首頁點擊切換語言按鈕。
2.  **檢查各區塊：**
    *   **Skills:** 標題與類別名稱是否變更？圖表數據是否正確？
    *   **Experience:** 工作經歷內容是否切換為英文/中文？
    *   **Projects:** 專案描述是否切換？
    *   **Contact:** 表單標籤與提示文字是否切換？
3.  **UI Layout:** 檢查切換到英文後，較長的字串是否導致跑版 (Overflow)，特別是 `ExperienceSection` 的時間軸與 `ContactSection` 的表單。

---

### **Section 4: Commit 程式碼分析與審查 (Analysis & Review)**

#### **4.1 邏輯檢查與改善建議 (Logical Errors & Improvements)**

*   **全域變數風險 (`constants.dart`):** 目前 `constants.dart` 導出了一個全域變數 `resumeData`。為了避免開發者誤用導致語言切換失敗，建議將 `resumeData` 標記為 `@deprecated`，並在註解中指引使用 `LanguageProvider`。
*   **Skills Category 過濾邏輯 (`skills_section.dart`):**
    *   目前程式碼使用硬編碼的 List `['Frontend', ...]` 同時作為「過濾條件」與「顯示標題」。
    *   **改善建議:** 
        *   **過濾:** 繼續使用英文 Key (對應 `Skill` model 的 `category` 欄位)。
        *   **顯示:** 在 UI 渲染時，將英文 Key 轉換為翻譯字串 (例如 `tr('skillCategoryFrontend')`)。
*   **_SkillsChartVertical 資料依賴:**
    *   該 Widget 內部直接依賴全域 `resumeData`。
    *   **改善建議:** 應改為從建構函式傳入 `List<Skill>`，使其成為 Pure Component，便於測試與重用，且確保資料來源與父層一致。

#### **4.2 提交訊息 (Commit Message)**

```text
feat: localize skills, experience, projects, and contact sections

- Update SkillsSection to use LanguageProvider and localize category titles
- Update ExperienceSection and ProjectsSection to fetch data from provider
- Localize all hardcoded UI strings in ContactSection (labels, hints, buttons)
- Add translation keys to en.json and zh.json
- Refactor _SkillsChartVertical to accept skills data via props
- Deprecate direct usage of global resumeData in favor of provider

Task-ID: FEAT-PORTFOLIO-LOCALIZATION-003
```
