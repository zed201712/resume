import '../models/resume_model.dart';

const kPrimaryColor = 0xFF4F46E5; // Indigo 600
const kSecondaryColor = 0xFF8B5CF6; // Violet 500
const kTextColor = 0xFF1E293B; // Slate 800
const kSubTextColor = 0xFF64748B; // Slate 500

const resumeDataZh = ResumeData(
  name: "大川大一 (Taichi Okawa)",
  title: "資深App工程師",
  bio: "台灣宜蘭出身, 2024年取得日本國籍。資訊工程系畢業, 在BIOS開發一年後, 轉換跑道進行App開發。此後8年期間 在iOS（Swift + UIKit / SwiftUI）開發累積相關經驗。以及3年的Android相關開發經驗。在目前的工作在職７年, 專案的程式碼行數１５萬左右, 負責開發 / 維護, 精通從整體架構的理解到細節的實作。雖然主要負責前端開發。 但也負責的後端部分開發, 使用PHP / Oracle 資料庫的開發 / 測試。擁有理解並設計開發整體系統的相關經驗。",
  email: "",
  phone: "",
  location: "台北市, 台灣",
  linkedin: "linkedin.com/in/alexlin",
  github: "github.com/alexlin-dev",
  skills: [
    Skill(name: "iOS (Swift/UIKit)", level: 95, category: "Frontend"),
    Skill(name: "SwiftUI", level: 70, category: "Frontend"),
    Skill(name: "Android (Java/Kotlin)", level: 80, category: "Frontend"),
    Skill(name: "Flutter", level: 40, category: "Frontend"),
    Skill(name: "Objective-C", level: 60, category: "Frontend"),
    Skill(name: "PHP", level: 80, category: "Backend"),
    Skill(name: "Oracle DB", level: 75, category: "Backend"),
    Skill(name: "Bash Script", level: 60, category: "Tools"),
    Skill(name: "Git / GitLab", level: 90, category: "Tools"),
    Skill(name: "CI/CD (DeployGate)", level: 85, category: "Tools"),
  ],
  experiences: [
    Experience(
      id: "exp1",
      company: "アイベック (株)",
      role: "iOS/Android/Server 工程師",
      period: "2018/06 - 2025/12",
      description: [
        "iOS App 規劃 / 開發 / 維護（Swift, UIKit, SwiftUI）。",
        "Android App開發（Java/Kotlin）。",
        "Server 應用開發（PHP, Oracle DB）。",
        "Git版本控制, Code review, 與開發成員協作。",
      ],
      skills: ["Swift", "Kotlin", "PHP", "Oracle", "GitLab"],
    ),
    Experience(
      id: "exp2",
      company: "三臻企業有限公司",
      role: "iOS 開發者",
      period: "2016/09 - 2017/10",
      description: [
        "Web攝影機應用開發。",
        "使用Objective-C／UIKit開發iOS App。",
        "UI實作, Debug, Server連結。",
      ],
      skills: ["Objective-C", "UIKit", "Git"],
    ),
    Experience(
      id: "exp3",
      company: "insyde (系微股份有限公司)",
      role: "BIOS/UEFI 韌體開發",
      period: "2015/05 - 2016/05",
      description: [
        "BIOS・UEFI韌體開發。",
        "學習使用C語言開發BIOS相關的基礎知識(啟動流程等)。",
        "分析程式碼, 修改功能, Debug。",
      ],
      skills: ["C", "Assembly", "SVN"],
    ),
  ],
  projects: [
    Project(
      id: "p1",
      title: "跨平台整合系統",
      description: "基於 Swift 與 Kotlin 的行動端應用，整合 PHP 後端與 Oracle 資料庫，支援高複雜度的業務邏輯。",
      image: "https://picsum.photos/seed/mobile-sys/800/450",
      tags: ["Swift", "Kotlin", "PHP", "Oracle"],
      link: "#",
    ),
    // Project(
    //   id: "p2",
    //   title: "Web Cam 控制應用",
    //   description: "針對網路攝影機開發的 iOS 控制端，支援即時串流預覽與裝置設定。",
    //   image: "https://picsum.photos/seed/webcam/800/450",
    //   tags: ["Objective-C", "UIKit", "IoT"],
    //   link: "#",
    // ),
  ],
);

const resumeDataEn = ResumeData(
  name: "Taichi Okawa",
  title: "Senior Mobile Engineer",
  bio: "Born in Yilan, Taiwan, acquired Japanese nationality in 2024. Graduated in Computer Science. After a year of BIOS development, switched to App development. Since then, accumulated 8 years of experience in iOS (Swift + UIKit / SwiftUI) and 3 years in Android development. Currently in the role for 7 years, managing a codebase of ~150k lines, covering everything from architecture to implementation details. While primarily a frontend developer, also experienced in backend development using PHP and Oracle DB. Proficient in understanding and designing entire system architectures.",
  email: "",
  phone: "",
  location: "Taipei, Taiwan",
  linkedin: "linkedin.com/in/alexlin",
  github: "github.com/alexlin-dev",
  skills: [
    Skill(name: "iOS (Swift/UIKit)", level: 95, category: "Frontend"),
    Skill(name: "SwiftUI", level: 70, category: "Frontend"),
    Skill(name: "Android (Java/Kotlin)", level: 80, category: "Frontend"),
    Skill(name: "Flutter", level: 40, category: "Frontend"),
    Skill(name: "Objective-C", level: 60, category: "Frontend"),
    Skill(name: "PHP", level: 80, category: "Backend"),
    Skill(name: "Oracle DB", level: 75, category: "Backend"),
    Skill(name: "Bash Script", level: 60, category: "Tools"),
    Skill(name: "Git / GitLab", level: 90, category: "Tools"),
    Skill(name: "CI/CD (DeployGate)", level: 85, category: "Tools"),
  ],
  experiences: [
    Experience(
      id: "exp1",
      company: "IBEX Co., Ltd.",
      role: "iOS/Android/Server Engineer",
      period: "2018/06 - 2025/12",
      description: [
        "iOS App Planning / Development / Maintenance (Swift, UIKit, SwiftUI).",
        "Android App Development (Java/Kotlin).",
        "Server Application Development (PHP, Oracle DB).",
        "Git version control, code reviews, and cross-team collaboration.",
      ],
      skills: ["Swift", "Kotlin", "PHP", "Oracle", "GitLab"],
    ),
    Experience(
      id: "exp2",
      company: "San Zhen Enterprise",
      role: "iOS Developer",
      period: "2016/09 - 2017/10",
      description: [
        "Web Camera Application Development.",
        "iOS App Development using Objective-C / UIKit.",
        "UI Implementation, Debugging, Server Integration.",
      ],
      skills: ["Objective-C", "UIKit", "Git"],
    ),
    Experience(
      id: "exp3",
      company: "Insyde Software",
      role: "BIOS/UEFI Firmware Developer",
      period: "2015/05 - 2016/05",
      description: [
        "BIOS / UEFI Firmware Development.",
        "Learned fundamentals of BIOS development using C language (boot process, etc.).",
        "Code analysis, feature modification, and debugging.",
      ],
      skills: ["C", "Assembly", "SVN"],
    ),
  ],
  projects: [
    Project(
      id: "p1",
      title: "Integrated Mobile System",
      description: "Mobile application based on Swift and Kotlin, integrated with PHP backend and Oracle DB, supporting complex business logic.",
      image: "https://picsum.photos/seed/mobile-sys/800/450",
      tags: ["Swift", "Kotlin", "PHP", "Oracle"],
      link: "#",
    ),
  ],
);

const resumeDataJa = ResumeData(
  name: "大川大一 (Taichi Okawa)",
  title: "シニアモバイルエンジニア",
  bio: "台湾宜蘭出身、2024年に日本国籍を取得。情報工学科卒。BIOS開発を1年経験した後、アプリ開発へ転向。その後8年間、iOS（Swift + UIKit / SwiftUI）開発の経験を積み、Android開発も3年の経験があります。現職には7年在籍し、約15万行のコード規模のプロジェクトにおいて、開発・保守を担当。全体アーキテクチャの理解から詳細実装まで精通しています。主にフロントエンド開発を担当していますが、バックエンド開発も担当しており、PHP / Oracleデータベースを用いた開発・テストを行っています。システム全体の設計・開発を理解し、担当した経験を持っています。",
  email: "",
  phone: "",
  location: "台湾、台北市",
  linkedin: "linkedin.com/in/alexlin",
  github: "github.com/alexlin-dev",
  skills: [
    Skill(name: "iOS (Swift/UIKit)", level: 95, category: "Frontend"),
    Skill(name: "SwiftUI", level: 70, category: "Frontend"),
    Skill(name: "Android (Java/Kotlin)", level: 80, category: "Frontend"),
    Skill(name: "Flutter", level: 40, category: "Frontend"),
    Skill(name: "Objective-C", level: 60, category: "Frontend"),
    Skill(name: "PHP", level: 80, category: "Backend"),
    Skill(name: "Oracle DB", level: 75, category: "Backend"),
    Skill(name: "Bash Script", level: 60, category: "Tools"),
    Skill(name: "Git / GitLab", level: 90, category: "Tools"),
    Skill(name: "CI/CD (DeployGate)", level: 85, category: "Tools"),
  ],
  experiences: [
    Experience(
      id: "exp1",
      company: "アイベック (株)",
      role: "iOS/Android/サーバーエンジニア",
      period: "2018/06 - 2025/12",
      description: [
        "iOSアプリの企画・開発・保守（Swift, UIKit, SwiftUI）。",
        "Androidアプリ開発（Java/Kotlin）。",
        "サーバーアプリケーション開発（PHP, Oracle DB）。",
        "Gitバージョン管理、コードレビュー、チーム連携。",
      ],
      skills: ["Swift", "Kotlin", "PHP", "Oracle", "GitLab"],
    ),
    Experience(
      id: "exp2",
      company: "三臻企業有限公司",
      role: "iOS 開発者",
      period: "2016/09 - 2017/10",
      description: [
        "Webカメラアプリ開発。",
        "Objective-C / UIKitを使用したiOSアプリ開発。",
        "UI実装、デバッグ、サーバー連携。",
      ],
      skills: ["Objective-C", "UIKit", "Git"],
    ),
    Experience(
      id: "exp3",
      company: "insyde (系微股份有限公司)",
      role: "BIOS/UEFI ファームウェア開発",
      period: "2015/05 - 2016/05",
      description: [
        "BIOS・UEFIファームウェア開発。",
        "C言語を用いたBIOS開発の基礎知識習得（起動プロセス等）。",
        "コード解析、機能修正、デバッグ。",
      ],
      skills: ["C", "Assembly", "SVN"],
    ),
  ],
  projects: [
    Project(
      id: "p1",
      title: "クロスプラットフォーム統合システム",
      description: "SwiftとKotlinをベースにしたモバイルアプリで、PHPバックエンドとOracle DBを統合し、複雑な業務ロジックをサポート。",
      image: "https://picsum.photos/seed/mobile-sys/800/450",
      tags: ["Swift", "Kotlin", "PHP", "Oracle"],
      link: "#",
    ),
  ],
);

// Backward compatibility or default
@Deprecated('Use LanguageProvider to get localized ResumeData')
const resumeData = resumeDataZh;
