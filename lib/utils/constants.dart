import '../models/resume_model.dart';

const kPrimaryColor = 0xFF4F46E5; // Indigo 600
const kSecondaryColor = 0xFF8B5CF6; // Violet 500
const kTextColor = 0xFF1E293B; // Slate 800
const kSubTextColor = 0xFF64748B; // Slate 500

const resumeDataZh = ResumeData(
  name: "大川大一 (Taichi Okawa)",
  title: "資深App工程師",
  bio: "台灣宜蘭出身, 2024年取得日本國籍。\n資訊工程系畢業, 在BIOS開發1年後, 轉換跑道進行App開發。\n在前一份工作7年期間, 負責開發 / 維護, 熟悉從整體架構的理解到細節的實作。\n雖然主要負責iOS前端開發(Swift / UIKit / SwiftUI)。 但也負責Android(Java / Kotlin)以及後端部分開發(PHP / Oracle)。擁有理解並設計開發整體系統的相關經驗。",
  email: "",
  phone: "",
  location: "台北市, 台灣",
  linkedin: "",
  github: "github.com/zed201712",
  skills: [
    Skill(name: "iOS (Swift/UIKit)", level: 95, category: "Frontend"),
    Skill(name: "SwiftUI", level: 70, category: "Frontend"),
    Skill(name: "Android (Java/Kotlin)", level: 80, category: "Frontend"),
    Skill(name: "Flutter", level: 40, category: "Frontend"),
    Skill(name: "Objective-C", level: 60, category: "Frontend"),
    Skill(name: "PHP", level: 80, category: "Backend"),
    Skill(name: "Oracle DB", level: 75, category: "Backend"),
    Skill(name: "Git / GitLab", level: 90, category: "Tools"),
    Skill(name: "CI/CD (DeployGate)", level: 85, category: "Tools"),
    Skill(name: "Bash Script", level: 60, category: "Tools"),
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
      skills: ["C", "SVN"],
    ),
  ],
  projects: [
    Project(
      id: "p1",
      title: "線上多人紙牌遊戲",
      description: "基於 AI開發的 Flutter 的手機端應用，以Android Studio + gemini 用AI實作了90%以上的程式碼的多人紙牌遊戲。",
      image: "https://raw.githubusercontent.com/zed201712/ok_multipl_poker/main/assets/images/zoo_cards/zoo_bg_002.png",
      tags: ["Flutter", "Dart", "Gemini"],
      link: "https://zed201712.github.io/ok_multipl_poker/",
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
  bio: "Born in Yilan, Taiwan, and acquired Japanese nationality in 2024.\nGraduated from Computer Science Dept. After 1 year of BIOS development, I transitioned to App development.\nDuring my 7 years in my previous role, I was responsible for development and maintenance, and I am proficient in everything from overall architecture to detailed implementation.\nWhile primarily focused on iOS frontend development (Swift / UIKit / SwiftUI), I have also handled Android development (Java / Kotlin) and backend development (PHP / Oracle). I have experience in understanding and designing entire systems.",
  email: "",
  phone: "",
  location: "Taipei, Taiwan",
  linkedin: "",
  github: "github.com/zed201712",
  skills: [
    Skill(name: "iOS (Swift/UIKit)", level: 95, category: "Frontend"),
    Skill(name: "SwiftUI", level: 70, category: "Frontend"),
    Skill(name: "Android (Java/Kotlin)", level: 80, category: "Frontend"),
    Skill(name: "Flutter", level: 40, category: "Frontend"),
    Skill(name: "Objective-C", level: 60, category: "Frontend"),
    Skill(name: "PHP", level: 80, category: "Backend"),
    Skill(name: "Oracle DB", level: 75, category: "Backend"),
    Skill(name: "Git / GitLab", level: 90, category: "Tools"),
    Skill(name: "CI/CD (DeployGate)", level: 85, category: "Tools"),
    Skill(name: "Bash Script", level: 60, category: "Tools"),
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
      skills: ["C", "SVN"],
    ),
  ],
  projects: [
    Project(
      id: "p1",
      title: "Online Multiplayer Card Game",
      description: "AI-based Flutter mobile application. Used Android Studio + Gemini to implement over 90% of the code for this multiplayer card game using AI.",
      image: "https://raw.githubusercontent.com/zed201712/ok_multipl_poker/main/assets/images/zoo_cards/zoo_bg_002.png",
      tags: ["Flutter", "Dart", "Gemini"],
      link: "https://zed201712.github.io/ok_multipl_poker/",
    ),
  ],
);

const resumeDataJa = ResumeData(
  name: "大川大一 (Taichi Okawa)",
  title: "シニアモバイルエンジニア",
  bio: "台湾・宜蘭出身、2024年に日本国籍を取得。\n情報工学科を卒業後、BIOS開発を1年経験し、アプリ開発へ転向。\n前職での7年間、開発・保守を担当し、全体アーキテクチャの理解から詳細の実装まで携わってきました。\n主にiOSフロントエンド開発（Swift / UIKit / SwiftUI）を担当してきましたが、Android（Java / Kotlin）やバックエンド（PHP / Oracle）の開発経験もあり、システム全体の設計・開発を深く理解しています。",
  email: "",
  phone: "",
  location: "台湾・台北",
  linkedin: "",
  github: "github.com/zed201712",
  skills: [
    Skill(name: "iOS (Swift/UIKit)", level: 95, category: "Frontend"),
    Skill(name: "SwiftUI", level: 70, category: "Frontend"),
    Skill(name: "Android (Java/Kotlin)", level: 80, category: "Frontend"),
    Skill(name: "Flutter", level: 40, category: "Frontend"),
    Skill(name: "Objective-C", level: 60, category: "Frontend"),
    Skill(name: "PHP", level: 80, category: "Backend"),
    Skill(name: "Oracle DB", level: 75, category: "Backend"),
    Skill(name: "Git / GitLab", level: 90, category: "Tools"),
    Skill(name: "CI/CD (DeployGate)", level: 85, category: "Tools"),
    Skill(name: "Bash Script", level: 60, category: "Tools"),
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
      skills: ["C", "SVN"],
    ),
  ],
  projects: [
    Project(
      id: "p1",
      title: "オンラインマルチプレイヤーカードゲーム",
      description: "AIベースで開発されたFlutterモバイルアプリ。Android Studio + Geminiを使用し、コードの90%以上をAIによって実装したマルチプレイヤーカードゲームです。",
      image: "https://raw.githubusercontent.com/zed201712/ok_multipl_poker/main/assets/images/zoo_cards/zoo_bg_002.png",
      tags: ["Flutter", "Dart", "Gemini"],
      link: "https://zed201712.github.io/ok_multipl_poker/",
    ),
  ],
);

// Backward compatibility or default
@Deprecated('Use LanguageProvider to get localized ResumeData')
const resumeData = resumeDataZh;
