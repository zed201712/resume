## AI 專案任務指示文件 (Feature Task)

| 區塊 | 內容 ||:---|:---|
| **任務 ID (Task ID)** | `FEAT-RESUME-APP-INIT-001` |
| **標題 (Title)** | `INITIALIZE FLUTTER RESUME APP WITH PROVIDER` |
| **創建日期 (Date)** | `2025/12/29` |
| **目標版本 (Target Version)** | `1.0.0` |
| **專案名稱 (Project)** | `flutter_resume_app` |

---

### **Section 1: 核心任務定義 (Core Task Definition)**

#### **1.1 任務目標 (Goal)** **【必填】**

*   **說明：** 將既有的 SwiftUI 履歷 App (`MyResume`) 移植至 Flutter 框架。
*   **目的：**
    1.  **跨平台移植 (Cross-Platform Porting)：** 依據提供的 Swift 程式碼 (`ContentView.swift`, `ContactView.swift`, `DotLineShape.swift`)，重建 UI 與互動邏輯。
    2.  **狀態管理 (State Management)：** 使用 `Provider` 套件來管理 App 的資料狀態（如履歷資料）與 UI 狀態（如聯絡視窗的顯示/隱藏）。
    3.  **UI 復刻 (UI Replication)：** 實作包含個人資訊卡片、技能列表、經歷時間軸 (`DotLineShape`) 以及聯絡資訊彈出層。

#### **1.2 詳細需求 (Detailed Requirements)** **【必填】**

1.  **資料模型與狀態 (Data Model & State)**
    *   建立 `Resume` 資料模型 (Dart Class)，包含：
        *   `name`, `title`, `location`, `bio` (String)
        *   `skills` (List<String>)
        *   `experiences` (List<Experience>)：包含 `start`, `end`, `title`, `company`。
        *   `phoneUrl`, `socialMedia` (List<SocialMedia>)。
    *   建立 `ResumeProvider` (extends `ChangeNotifier`)：
        *   持有 `Resume` 資料單例。
        *   管理 `isShowingContact` (bool) 狀態，提供 `toggleContactView()` 或 `setContactView(bool)` 方法。

2.  **UI 架構與組件 (UI Architecture & Components)**
    *   **Main Screen (`ContentView` equivalent):**
        *   使用 `Stack` 結構：底層為 `SingleChildScrollView` (主要內容)，上層為 `ContactView` (Overlay)。
        *   背景色需對應 `secondarySystemBackground` (使用 `Colors.grey[200]` 或類似)。
    *   **CardView:** 顯示圓形頭像、姓名、職稱、地點 (使用 `Icon(Icons.location_on)`).
    *   **SkillView:** 顯示技能圖示與文字，使用 `Row` 或 `Wrap` 排列。
    *   **ExperienceView & DotLineShape:**
        *   實作 `CustomPainter` 來繪製 `DotLineShape`。
        *   需支援三種樣式：`bottomHalf` (第一筆), `full` (中間), `topHalf` (最後一筆)。
        *   列表呈現經歷的時間、職稱、公司。
    *   **ContactView (Overlay):**
        *   根據 `ResumeProvider.isShowingContact` 決定顯示或隱藏 (使用 `AnimatedPositioned` 或 `Visibility` 搭配 Animation)。
        *   點擊電話或社群圖示需呼叫 `url_launcher` 開啟連結。

3.  **外部依賴 (External Dependencies)**
    *   `provider`: ^6.0.0 (或最新版)
    *   `url_launcher`: 用於開啟電話與網頁連結。

---

### **Section 2: 技術細節與範圍 (Technical Scope & Constraints)**

#### **2.1 受影響/新增的檔案清單 (Affected Files)** **【必填】**

*   **新增：** `lib/main.dart` (App 入口，設定 MultiProvider)
*   **新增：** `lib/models/resume_model.dart` (資料模型)
*   **新增：** `lib/providers/resume_provider.dart` (狀態管理)
*   **新增：** `lib/screens/home_screen.dart` (對應 ContentView)
*   **新增：** `lib/widgets/contact_view.dart` (對應 ContactView)
*   **新增：** `lib/widgets/dot_line_painter.dart` (對應 DotLineShape)
*   **資源：** `assets/images/` (需配置 pubspec.yaml 以讀取 avatar, skill icons)

#### **2.2 程式碼風格 (Style)**

*   遵循 `Effective Dart` 風格指南。
*   變數命名使用 `lowerCamelCase`。
*   Widget 拆分原則：將大型 UI 區塊 (Card, Skill, Experience) 拆分為獨立的 Stateless Widget 或 Helper Methods。

---

### **Section 3: 驗證與輸出 (Verification & Output)**

#### **3.1 驗證步驟 (Verification Steps)**

1.  **UI 檢查：**
    *   啟動 App，確認 ScrollView 可滑動。
    *   確認 `DotLineShape` 的線條與圓點位置在不同 index (頭/中/尾) 顯示正確。
2.  **互動測試：**
    *   點擊 "Contact Me" 按鈕，確認 `isShowingContact` 變為 true，且 ContactView 以動畫或疊加方式出現。
    *   點擊黑色半透明背景或 "取消" 按鈕，確認 ContactView 消失。
3.  **功能測試：**
    *   確認點擊電話與社群圖示能觸發 URL 開啟行為 (模擬器中可能需觀察 Console Log)。

---

### **Section 4: Commit 程式碼分析與審查 (Analysis & Review)**

#### **4.1 潛在影響分析**

*   **資源依賴：** 由於原始 Swift 專案依賴本地 Assets (`avatar`, `skill icons`)，Flutter 專案需建立對應的假圖或 Placeholder，除非有提供實際圖片檔。
*   **平台差異：** `UIScreen.main.bounds` 在 Flutter 中應使用 `MediaQuery.of(context).size` 替代。

#### **4.2 審查結論**
*   此規格完整覆蓋了 Swift 原檔的功能，並正確轉換為 Flutter 的 Provider 架構。

