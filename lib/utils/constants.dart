import '../models/resume_model.dart';

const kPrimaryColor = 0xFF4F46E5; // Indigo 600
const kSecondaryColor = 0xFF8B5CF6; // Violet 500
const kTextColor = 0xFF1E293B; // Slate 800
const kSubTextColor = 0xFF64748B; // Slate 500

const resumeDataZh = ResumeData(
  name: "林小明 (Alex Lin)",
  title: "資深全端工程師 / AI 應用開發者",
  bio: "擁有超過 5 年的 Web 開發經驗，專注於 React 生態系與生成式 AI 的整合應用。熱衷於打造直觀且具備影響力的使用者體驗，並持續探索新技術與產品化的可能性。",
  email: "alex.lin.dev@example.com",
  phone: "+886 912 345 678",
  location: "台北市, 台灣",
  linkedin: "linkedin.com/in/alexlin",
  github: "github.com/alexlin-dev",
  skills: [
    Skill(name: "React / Next.js", level: 95, category: "Frontend"),
    Skill(name: "TypeScript", level: 90, category: "Frontend"),
    Skill(name: "Tailwind CSS", level: 92, category: "Frontend"),
    Skill(name: "Node.js / NestJS", level: 85, category: "Backend"),
    Skill(name: "PostgreSQL / MongoDB", level: 80, category: "Backend"),
    Skill(name: "Gemini / OpenAI API", level: 88, category: "Tools"),
    Skill(name: "Docker / AWS", level: 75, category: "Tools"),
    Skill(name: "專案管理", level: 85, category: "Soft Skills"),
    Skill(name: "跨團隊溝通", level: 90, category: "Soft Skills"),
  ],
  experiences: [
    Experience(
      id: "exp1",
      company: "未來科技 (Future Tech Inc.)",
      role: "資深前端工程師",
      period: "2021 - 現在",
      description: [
        "領導開發公司旗艦級 SaaS 平台，提升頁面加載速度 40%。",
        "導入 AI 輔助開發流程，降低團隊程式碼審核時間達 25%。",
        "建立公司內部 UI 組件庫，跨專案節省 30% 開發人力。",
      ],
      skills: ["React", "TypeScript", "Micro-frontend", "Jenkins"],
    ),
    Experience(
      id: "exp2",
      company: "創新數位 (Innovate Digital)",
      role: "全端工程師",
      period: "2018 - 2021",
      description: [
        "開發高流量電商平台，支援每日 10 萬級併發造訪。",
        "負責後端 API 設計與優化，將資料查詢效率提升 60%。",
        "協助產品從 0 到 1 的建立，並在一年內達到 5 萬月活人數。",
      ],
      skills: ["Node.js", "Express", "Vue.js", "PostgreSQL"],
    ),
  ],
  projects: [
    Project(
      id: "p1",
      title: "AI 智慧面試助手",
      description: "基於 Gemini API 開發的模擬面試平台，提供即時音訊回饋與表現評分。",
      image: "https://picsum.photos/seed/ai-interview/800/450",
      tags: ["React", "Gemini API", "Web Audio API"],
      link: "#",
    ),
    Project(
      id: "p2",
      title: "分散式看板系統",
      description: "支援多人協作、即時同步的專案管理工具，整合視覺化數據分析。",
      image: "https://picsum.photos/seed/kanban/800/450",
      tags: ["Next.js", "Socket.io", "D3.js"],
      link: "#",
    ),
    Project(
      id: "p3",
      title: "跨境物流追蹤器",
      description: "串接多個國際快遞 API，提供一站式的包裹追蹤與視覺化地圖顯示。",
      image: "https://picsum.photos/seed/logistics/800/450",
      tags: ["Google Maps API", "NestJS", "Tailwind"],
      link: "#",
    ),
  ],
);

const resumeDataEn = ResumeData(
  name: "Alex Lin",
  title: "Senior Full Stack Engineer / AI App Developer",
  bio: "With over 5 years of web development experience, focusing on the React ecosystem and Generative AI integration. Passionate about building intuitive and impactful user experiences and continuously exploring new technologies.",
  email: "alex.lin.dev@example.com",
  phone: "+886 912 345 678",
  location: "Taipei, Taiwan",
  linkedin: "linkedin.com/in/alexlin",
  github: "github.com/alexlin-dev",
  skills: [
    Skill(name: "React / Next.js", level: 95, category: "Frontend"),
    Skill(name: "TypeScript", level: 90, category: "Frontend"),
    Skill(name: "Tailwind CSS", level: 92, category: "Frontend"),
    Skill(name: "Node.js / NestJS", level: 85, category: "Backend"),
    Skill(name: "PostgreSQL / MongoDB", level: 80, category: "Backend"),
    Skill(name: "Gemini / OpenAI API", level: 88, category: "Tools"),
    Skill(name: "Docker / AWS", level: 75, category: "Tools"),
    Skill(name: "Project Management", level: 85, category: "Soft Skills"),
    Skill(name: "Cross-team Comm", level: 90, category: "Soft Skills"),
  ],
  experiences: [
    Experience(
      id: "exp1",
      company: "Future Tech Inc.",
      role: "Senior Frontend Engineer",
      period: "2021 - Present",
      description: [
        "Led the development of flagship SaaS platform, improving page load speed by 40%.",
        "Introduced AI-assisted workflow, reducing code review time by 25%.",
        "Established internal UI component library, saving 30% development effort across projects.",
      ],
      skills: ["React", "TypeScript", "Micro-frontend", "Jenkins"],
    ),
    Experience(
      id: "exp2",
      company: "Innovate Digital",
      role: "Full Stack Engineer",
      period: "2018 - 2021",
      description: [
        "Developed high-traffic e-commerce platform supporting 100k daily concurrent visits.",
        "Optimized backend API design, improving data query efficiency by 60%.",
        "Assisted in 0-to-1 product launch, reaching 50k MAU within a year.",
      ],
      skills: ["Node.js", "Express", "Vue.js", "PostgreSQL"],
    ),
  ],
  projects: [
    Project(
      id: "p1",
      title: "AI Interview Assistant",
      description: "Mock interview platform based on Gemini API, providing real-time audio feedback and scoring.",
      image: "https://picsum.photos/seed/ai-interview/800/450",
      tags: ["React", "Gemini API", "Web Audio API"],
      link: "#",
    ),
    Project(
      id: "p2",
      title: "Distributed Kanban",
      description: "Real-time collaborative project management tool with visual data analytics.",
      image: "https://picsum.photos/seed/kanban/800/450",
      tags: ["Next.js", "Socket.io", "D3.js"],
      link: "#",
    ),
    Project(
      id: "p3",
      title: "Logistics Tracker",
      description: "Cross-border parcel tracking with visual map display, integrating multiple courier APIs.",
      image: "https://picsum.photos/seed/logistics/800/450",
      tags: ["Google Maps API", "NestJS", "Tailwind"],
      link: "#",
    ),
  ],
);

// Backward compatibility or default
@Deprecated('Use LanguageProvider to get localized ResumeData')
const resumeData = resumeDataZh;
