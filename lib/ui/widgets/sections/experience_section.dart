import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants.dart';
import '../../../providers/language_provider.dart';
import '../../../models/resume_model.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeData = context.watch<LanguageProvider>().getResumeData(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(kPrimaryColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(LucideIcons.briefcase, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  tr('experienceTitle'),
                  style: GoogleFonts.notoSansTc(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(kTextColor),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 2,
                  color: const Color(0xFFE2E8F0), // Slate 200
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),

          // Timeline Content
          Stack(
            children: [
              // Vertical Line
              Positioned(
                left: 17,
                top: 8,
                bottom: 8,
                child: Container(
                  width: 2,
                  color: const Color(0xFFE2E8F0), // Slate 200
                ),
              ),
              // Experiences
              Column(
                children: resumeData.experiences.map((exp) => _ExperienceItem(experience: exp)).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final Experience experience;

  const _ExperienceItem({required this.experience});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 48, bottom: 48),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Dot
          Positioned(
            left: -48,
            top: 4,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFE2E8F0), width: 2),
              ),
              child: Center(
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFFCBD5E1), // Slate 300
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          // Content Card
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFF1F5F9)), // Slate 100
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flex(
                  direction: MediaQuery.of(context).size.width < 768 ? Axis.vertical : Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          experience.role,
                          style: GoogleFonts.notoSansTc(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color(kTextColor),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          experience.company,
                          style: GoogleFonts.notoSansTc(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color(kPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                    if (MediaQuery.of(context).size.width < 768) const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC), // Slate 50
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFF1F5F9)),
                      ),
                      child: Text(
                        experience.period,
                        style: GoogleFonts.notoSansTc(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF94A3B8), // Slate 400
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ...experience.description.map<Widget>((desc) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Icon(LucideIcons.chevronRight, size: 20, color: Color(0xFF818CF8)), // Indigo 400
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              desc,
                              style: GoogleFonts.notoSansTc(
                                fontSize: 16,
                                color: const Color(kSubTextColor),
                                height: 1.6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )).toList(),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: experience.skills.map<Widget>((skill) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9), // Slate 100
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          skill,
                          style: GoogleFonts.notoSansTc(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color(kSubTextColor),
                            letterSpacing: 0.5,
                          ),
                        ),
                      )).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
