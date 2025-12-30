import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import '../../providers/language_provider.dart';
import '../../utils/constants.dart';
import '../widgets/ai_assistant_widget.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/sections/experience_section.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/projects_section.dart';
import '../widgets/sections/skills_section.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  // Keys for scrolling to sections
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resumeData = context.watch<LanguageProvider>().getResumeData(context);
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Main Content
          SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.only(top: 80, bottom: 80), // Space for Navbar and Footer
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1152), // max-w-6xl
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      // Sections
                      SizedBox(key: _heroKey, child: const HeroSection()),
                      const SizedBox(height: 128),
                      SizedBox(key: _skillsKey, child: const SkillsSection()),
                      const SizedBox(height: 128),
                      SizedBox(key: _experienceKey, child: const ExperienceSection()),
                      const SizedBox(height: 128),
                      SizedBox(key: _projectsKey, child: const ProjectsSection()),
                      const SizedBox(height: 128),
                      SizedBox(key: _contactKey, child: const ContactSection()),
                      
                      // Footer
                      const SizedBox(height: 160),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide(color: Color(0xFFE2E8F0))), // Slate 200
                        ),
                        child: Flex(
                          direction: MediaQuery.of(context).size.width < 768 ? Axis.vertical : Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "footerBuiltWith".tr(namedArgs: {"name": resumeData.name}),
                              style: GoogleFonts.notoSansTc(
                                fontSize: 14,
                                color: const Color(kSubTextColor),
                              ),
                            ),
                            if (MediaQuery.of(context).size.width < 768) const SizedBox(height: 16),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {}, // Link handled in HeroSection already, just UI here
                                  icon: const Icon(LucideIcons.github, size: 20, color: Color(0xFF94A3B8)),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(LucideIcons.linkedin, size: 20, color: Color(0xFF94A3B8)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Navbar (Glassmorphism)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                border: const Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
              ),
              child: ClipRect(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1152),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.notoSansTc(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF4338CA), // Indigo 700
                                  letterSpacing: -0.5,
                                ),
                                children: const [
                                  TextSpan(text: "Portfolio"),
                                  TextSpan(
                                    text: ".",
                                    style: TextStyle(color: Color(0xFF94A3B8)), // Slate 400
                                  ),
                                ],
                              ),
                            ),
                            if (MediaQuery.of(context).size.width >= 768)
                              Row(
                                children: [
                                  _NavButton(title: "navAbout".tr(), onTap: () => _scrollToSection(_heroKey)),
                                  _NavButton(title: "navSkills".tr(), onTap: () => _scrollToSection(_skillsKey)),
                                  _NavButton(title: "navExperience".tr(), onTap: () => _scrollToSection(_experienceKey)),
                                  _NavButton(title: "navProjects".tr(), onTap: () => _scrollToSection(_projectsKey)),
                                  const SizedBox(width: 16),
                                  ElevatedButton(
                                    onPressed: () => _scrollToSection(_contactKey),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(kPrimaryColor),
                                      foregroundColor: Colors.white,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                      textStyle: GoogleFonts.notoSansTc(fontWeight: FontWeight.w500),
                                    ),
                                    child: Text("navContact".tr()),
                                  ),
                                  const SizedBox(width: 16),
                                  _LanguageSwitcher(),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          ),

          // AI Assistant
          const AiAssistantWidget(),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF475569), // Slate 600
        textStyle: GoogleFonts.notoSansTc(fontSize: 14, fontWeight: FontWeight.w500),
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      child: Text(title),
    );
  }
}

class _LanguageSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9), // Slate 100
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LangButton(
            locale: const Locale('zh'),
            label: '中文',
            isSelected: context.locale.languageCode == 'zh',
          ),
          _LangButton(
            locale: const Locale('en'),
            label: 'EN',
            isSelected: context.locale.languageCode == 'en',
          ),
        ],
      ),
    );
  }
}

class _LangButton extends StatelessWidget {
  final Locale locale;
  final String label;
  final bool isSelected;

  const _LangButton({
    required this.locale,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.setLocale(locale);
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSansTc(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? const Color(kPrimaryColor) : const Color(kSubTextColor),
          ),
        ),
      ),
    );
  }
}
