import '../models/resume_model.dart';

const kPrimaryColor = 0xFF4F46E5; // Indigo 600
const kSecondaryColor = 0xFF8B5CF6; // Violet 500
const kTextColor = 0xFF1E293B; // Slate 800
const kSubTextColor = 0xFF64748B; // Slate 500

const resumeDataZh = ResumeData(
  name: "大川大一 (Taichi Okawa)",
  title: "資深App工程師",
  bio: "台灣宜蘭出身, 2024年取得日本國籍。\n資訊工程系畢業, 在BIOS開發1年後, 轉換跑道進行App開發。\n\n在前一份工作的7年間，我主要負責 iOS 前端開發（Swift / UIKit / SwiftUI），同時參與 Android（Java / Kotlin）與後端（PHP / Oracle）的開發，熟悉從整體架構理解到細節實作的完整開發流程，並具備跨平台與系統設計的能力。\n\n離職後，我應用 AI Agent（如 Claude Code、Antigravity）進行個人 Flutter 專案開發，並嘗試以更高效率的方式完成產品實作。",
  email: "",
  phone: "",
  location: "台北市, 台灣",
  linkedin: "",
  github: "github.com/zed201712",
  skills: [
    Skill(name: "iOS (Swift/UIKit)", level: 90, category: "Frontend"),
    Skill(name: "Android (Java/Kotlin)", level: 70, category: "Frontend"),
    Skill(name: "Flutter", level: 40, category: "Frontend"),
    Skill(name: "PHP", level: 70, category: "Backend"),
    Skill(name: "XCode", level: 90, category: "Tools"),
    Skill(name: "Android Studio", level: 70, category: "Tools"),
  ],
  experiences: [
    Experience(
      id: "exp1",
      company: "アイベック (株)",
      role: "iOS/Android/Server 工程師",
      period: "2018/06 - 2025/12",
      description: [
        "會員數3,000萬 交友App 的 iOS 開發與（Swift / UIKit / SwiftUI） 7 年長期維運經驗。",
        "Swift 重構專案，在規格不明確情況下整理需求並重新設計核心功能。",
        "擔任 iOS Team Leader，負責技術選型、開發方針制定與新人指導。",
        "Android（Java / Kotlin）、Backend（PHP / Oracle DB）、PM、Design 團隊合作，推動跨部門開發。",
        "Git 版本控制流程與 Code Review 機制，提升團隊開發效率與品質。",
        "分析外部 library 並進行客製化修改。",
        "開發客製化 UI，提升操作體驗與互動流暢度。",
        "持續改善應用穩定性，降低 crash 並維持良好運行品質。",
        "重構舊系統，建立可維護且穩定的程式架構。",
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
  bio: "Born in Yilan, Taiwan, and acquired Japanese nationality in 2024.\nGraduated from the Department of Computer Science, I began my career in BIOS development for one year before transitioning to App development.\n\nDuring my seven years at my previous company, I primarily focused on iOS frontend development (Swift / UIKit / SwiftUI), while also contributing to Android development (Java / Kotlin) and backend development (PHP / Oracle). This experience allowed me to gain a deep understanding of complete system architecture as well as hands-on implementation, and to develop cross-platform design skills.\n\nAfter leaving my previous role, I began leveraging AI agents (such as Claude Code and Antigravity) in personal Flutter projects, focusing on improving development efficiency and integrating AI into practical workflows.",
  email: "",
  phone: "",
  location: "Taipei, Taiwan",
  linkedin: "",
  github: "github.com/zed201712",
  skills: [
    Skill(name: "iOS (Swift/UIKit)", level: 90, category: "Frontend"),
    Skill(name: "Android (Java/Kotlin)", level: 70, category: "Frontend"),
    Skill(name: "Flutter", level: 40, category: "Frontend"),
    Skill(name: "PHP", level: 70, category: "Backend"),
    Skill(name: "XCode", level: 90, category: "Tools"),
    Skill(name: "Android Studio", level: 70, category: "Tools"),
  ],
  experiences: [
    Experience(
      id: "exp1",
      company: "IBEX Co., Ltd.",
      role: "iOS/Android/Server Engineer",
      period: "2018/06 - 2025/12",
      description: [
        "Worked on iOS development (Swift, UIKit, SwiftUI) for a large-scale dating app with a registered user base of over 30 million, including 7 years of long-term maintenance and operation.",
        "Contributed to a Swift-based re-architecture project, clarifying ambiguous requirements and redesigning core features.",
        "Served as iOS Team Leader, driving technical decisions, defining development guidelines, and mentoring junior engineers.",
        "Collaborated cross-functionally with Android (Java/Kotlin), backend (PHP, Oracle DB), PM, and design teams to deliver features.",
        "Improved development workflow by establishing Git-based processes and code review practices, enhancing team efficiency and code quality.",
        "Evaluated and customized third-party libraries to meet product requirements.",
        "Designed and implemented custom UI components to improve usability and user interaction.",
        "Continuously improved application stability, reducing crashes and maintaining high reliability.",
        "Refactored legacy codebase to build a maintainable and scalable architecture.",
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
  bio: "台灣・宜蘭出身、2024年に日本国籍を取得。\n情報工学科を卒業後、BIOS開発を1年間経験した後、アプリ開発へキャリアチェンジしました。\n\n前職での7年間、主にiOSフロントエンド開発（Swift / UIKit / SwiftUI）を担当しつつ、Android（Java / Kotlin）やバックエンド（PHP / Oracle）の開発にも携わりました。この経験により、システム全体のアーキテクチャの理解から詳細実装まで深く習得し、クロスプラットフォームの設計能力を身につけました。\n\n退職後は、Claude Code や Antigravity などの AI Agent を活用し、個人の Flutter プロジェクト開発に取り組んでいます。開発効率の向上や、AIを活用した実践的な開発手法の検証にも取り組んでいます。",
  email: "",
  phone: "",
  location: "台湾・台北",
  linkedin: "",
  github: "github.com/zed201712",
  skills: [
    Skill(name: "iOS (Swift/UIKit)", level: 90, category: "Frontend"),
    Skill(name: "Android (Java/Kotlin)", level: 70, category: "Frontend"),
    Skill(name: "Flutter", level: 40, category: "Frontend"),
    Skill(name: "PHP", level: 70, category: "Backend"),
    Skill(name: "XCode", level: 90, category: "Tools"),
    Skill(name: "Android Studio", level: 70, category: "Tools"),
  ],
  experiences: [
    Experience(
      id: "exp1",
      company: "アイベック (株)",
      role: "iOS/Android/サーバーエンジニア",
      period: "2018/06 - 2025/12",
      description: [
        "会員数3,000万規模のマッチングアプリにおけるiOS開発（Swift / UIKit / SwiftUI）および7年間の運用・保守に従事。",
        "Swiftによるリニューアルプロジェクトにおいて、不明確な仕様の整理とコア機能の再設計・実装を実施。",
        "iOS Team Leaderとして、技術選定・開発方針の策定および新人の指導を担当。",
        "Android（Java / Kotlin）、Backend（PHP / Oracle DB）、PM、Designチームと連携し、クロスファンクショナルな開発を推進。",
        "Gitを用いた開発フローおよびCode Reviewプロセスを整備し、開発効率と品質を向上。",
        "外部ライブラリの調査・選定およびカスタマイズ対応を実施。",
        "カスタムUIの設計・実装により、操作性およびユーザー体験を改善。",
        "アプリの安定性向上に継続的に取り組み、クラッシュ低減と品質維持に貢献。",
        "既存システムのリファクタリングを行い、保守性と拡張性の高いアーキテクチャを構築。",
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
