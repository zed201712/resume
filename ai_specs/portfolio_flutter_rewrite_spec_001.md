## AI 專案任務指示文件 (Feature Task)

| 區塊 | 內容                                              |
|:---|:------------------------------------------------|
| **任務 ID (Task ID)** | `FEAT-PORTFOLIO-REWRITE-001`                    |
| **標題 (Title)** | `FLUTTER REWRITE OF AI PORTFOLIO WITH PROVIDER` |
| **創建日期 (Date)** | `2025/12/30`                                    |
| **目標版本 (Target Version)** | `1.0.0`                                         |
| **專案名稱 (Project)** | `resume`                                        |

---

### **Section 1: 核心任務定義 (Core Task Definition)**

#### **1.1 任務目標 (Goal)** **【必填】**

*   **說明：** 將現有的 React 專案 `ai-powered-professional-portfolio` 重寫為 Flutter Web 應用程式。
*   **目的：**
    1.  **框架遷移 (Migration)：** 建立統一的 Flutter 代碼庫，以便未來跨平台發布 (Web/Mobile)。
    2.  **狀態管理 (State Management)：** 使用 `Provider` 模式來管理應用程式狀態，特別是 AI 助手 (AI Assistant) 的對話狀態。
    3.  **代碼規範 (Style)：** 嚴格遵循 `effective_dart` 風格指南。

#### **1.2 詳細需求 (Detailed Requirements)** **【必填】**

1.  **狀態管理架構 (Provider Architecture)**
    *   **`ChatProvider` (`ChangeNotifier`):**
        *   **State:**
            *   `List<ChatMessage> messages`: 儲存對話紀錄 (User/Assistant)。
            *   `bool isOpen`: 控制聊天視窗的展開/收合。
            *   `bool isLoading`: 控制發送訊息時的載入動畫。
        *   **Actions:**
            *   `toggleChat()`: 切換視窗狀態。
            *   `sendMessage(String text)`: 處理用戶輸入，呼叫 Gemini Service (可先用 Mock)，更新 `messages` 並觸發 UI 更新。
    *   **`ThemeProvider` (Optional):** 若需支援深色模式切換。

2.  **UI 組件拆分 (Component Breakdown)**
    *   將原本單一的 `App.tsx` 拆分為多個 Widget：
        *   `PortfolioHomePage`: 主頁面 `Scaffold`。
        *   `NavBar`: 頂部導航列 (Glassmorphism effect)。
        *   `HeroSection`: 個人簡介與照片區域。
        *   `SkillsSection`: 使用 `fl_chart` 實現長條圖 (Bar Chart)，並列出技能標籤。
        *   `ExperienceSection`: 時間軸風格的工作經歷列表。
        *   `ProjectsSection`: 網格狀 (Grid) 的專案展示卡片。
        *   `ContactSection`: 聯絡表單與資訊。
        *   `AiAssistantWidget`: 懸浮按鈕與展開後的聊天介面 (`Stack` + `Positioned` 或 `Overlay`)。

3.  **資料模型 (Data Models)**
    *   建立強型別模型 (`lib/models/`) 對應 `constants.ts` 的結構：
        *   `ResumeData`, `Skill`, `Experience`, `Project`.
    *   將 `constants.ts` 轉換為 Dart const 變數或 `ResumeRepository`。

4.  **邏輯檢查與改善 (Logic Check & Improvements)**
    *   **捲動邏輯 (Scroll Logic):**
        *   *React:* 使用 `useRef` 與 `useEffect` 監聽 `messages` 變更來捲動到底部。
        *   *Flutter:* 應在 `ChatProvider` 完成訊息添加後，或在 Widget 的 `build` 週期後 (使用 `addPostFrameCallback`)，透過 `ScrollController.animateTo` 捲動到底部。建議使用 `reverse: true` 的 `ListView` 搭配倒序 list 以簡化置底邏輯。
    *   **響應式設計 (Responsive):**
        *   *React:* 使用 Tailwind (`md:`, `lg:`)。
        *   *Flutter:* 需使用 `LayoutBuilder` 或 `MediaQuery.of(context).size.width` 來判斷斷點 (Breakpoints)，決定 `Row` (Desktop) 或 `Column` (Mobile) 排列，以及 Grid 的 `crossAxisCount`。
    *   **表單處理:** React 的 `ContactSection` 只有 UI，Flutter 版建議預留 `Form` 與 `TextFormField` 的驗證邏輯接口。

---

### **Section 2: 技術細節與範圍 (Technical Scope & Constraints)**

#### **2.1 受影響/新增的檔案清單 (Affected Files)** **【必填】**

*   **新增：** `lib/main.dart` (App Entry)
*   **新增：** `lib/models/resume_model.dart`
*   **新增：** `lib/providers/chat_provider.dart`
*   **新增：** `lib/ui/screens/home_screen.dart`
*   **新增：** `lib/ui/widgets/ai_assistant_widget.dart`
*   **新增：** `lib/ui/widgets/sections/*.dart` (各區塊 Widget)
*   **新增：** `lib/utils/constants.dart`

#### **2.2 程式碼風格 (Style)**

*   **Linter:** 使用 `flutter_lints` 並遵循 `effective_dart`。
*   **命名:** 檔案使用 `snake_case`，類別使用 `UpperCamelCase`，變數使用 `lowerCamelCase`。
*   **結構:** 保持 Widget 樹的扁平化，盡量將複雜 UI 提取為獨立的小 Widget。

---

### **Section 3: 驗證與輸出 (Verification & Output)**

#### **3.1 驗證步驟 (Verification Steps)**

1.  **功能測試:**
    *   點擊 AI 助手按鈕，確認視窗展開/收合流暢。
    *   發送訊息，確認 `isLoading` 狀態顯示正確，且新訊息正確顯示於列表中。
2.  **UI 檢查:**
    *   檢查 `SkillsSection` 的圖表 (`fl_chart`) 是否正確渲染數據。
    *   調整瀏覽器視窗大小，確認 Mobile/Desktop 排版切換無破圖。
3.  **導航測試:**
    *   點擊 NavBar 連結，確認頁面平滑捲動至對應 Section (使用 `Scrollable.ensureVisible` 或外部套件)。

---

### **Section 4: Commit 程式碼分析與審查 (Analysis & Review)**

#### **4.1 潛在影響分析**

*   **資源依賴:** 需確認圖片連結 (picsum) 是否可用，或改用本地 assets 以確保穩定性。
*   **外部套件:** 引入 `provider`, `fl_chart`, `url_launcher`, `google_fonts`, `lucide_icons` (或使用 Material Icons 替代)。

#### **4.2 審查結論**
*   此重構將提升代碼的可維護性與型別安全性。使用 Provider 將 UI 與邏輯解耦，有利於未來擴充 AI 功能 (如串接真實 Backend)。
