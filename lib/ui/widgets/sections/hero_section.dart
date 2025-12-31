import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../providers/language_provider.dart';
import '../../../utils/constants.dart';
import '../social_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeData = context.watch<LanguageProvider>().getResumeData(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text Content
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    //   decoration: BoxDecoration(
                    //     color: const Color(kPrimaryColor).withOpacity(0.05),
                    //     borderRadius: BorderRadius.circular(20),
                    //     border: Border.all(color: const Color(kPrimaryColor).withOpacity(0.1)),
                    //   ),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       const Icon(LucideIcons.sparkles, size: 12, color: Color(kPrimaryColor)),
                    //       const SizedBox(width: 8),
                    //       Text(
                    //         "heroAvailable".tr(),
                    //         style: GoogleFonts.notoSansTc(
                    //           fontSize: 12,
                    //           fontWeight: FontWeight.bold,
                    //           color: const Color(kPrimaryColor),
                    //           letterSpacing: 1,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //const SizedBox(height: 24),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.notoSansTc(
                          fontSize: isMobile ? 36 : 60,
                          fontWeight: FontWeight.w900,
                          color: const Color(kTextColor),
                          height: 1.1,
                        ),
                        children: [
                          TextSpan(text: "${"heroHello".tr()} "),
                          TextSpan(
                            text: resumeData.name,
                            style: const TextStyle(
                              color: Color(kPrimaryColor), // Gradient effect simplified
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      resumeData.title,
                      style: GoogleFonts.notoSansTc(
                        fontSize: isMobile ? 20 : 24,
                        fontWeight: FontWeight.w500,
                        color: const Color(kSubTextColor),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      resumeData.bio,
                      style: GoogleFonts.notoSansTc(
                        fontSize: 18,
                        color: const Color(kSubTextColor),
                        height: 1.6,
                      ),
                    ),
                    // const SizedBox(height: 32),
                    // Wrap(
                    //   spacing: 16,
                    //   runSpacing: 16,
                    //   children: [
                    //     ElevatedButton.icon(
                    //       onPressed: () {
                    //         // Mock Download
                    //       },
                    //       icon: const Icon(LucideIcons.fileText, size: 20),
                    //       label: Text("heroDownloadResume".tr()),
                    //       style: ElevatedButton.styleFrom(
                    //         backgroundColor: const Color(0xFF0F172A), // Slate 900
                    //         foregroundColor: Colors.white,
                    //         padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    //         textStyle: GoogleFonts.notoSansTc(fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //     SocialButton(
                    //       icon: LucideIcons.github,
                    //       url: "https://${resumeData.github}",
                    //     ),
                    //     SocialButton(
                    //       icon: LucideIcons.linkedin,
                    //       url: "https://${resumeData.linkedin}",
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              if (!isMobile) const SizedBox(width: 48),
              if (isMobile) const SizedBox(height: 48),
              // Image Content
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: 6 * 3.14159 / 180,
                      child: Container(
                        width: isMobile ? 280 : 380,
                        height: isMobile ? 280 : 380,
                        decoration: BoxDecoration(
                          color: const Color(kPrimaryColor).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(48),
                        ),
                      ),
                    ),
                    Container(
                      width: isMobile ? 280 : 380,
                      height: isMobile ? 280 : 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48),
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        image: const DecorationImage(
                          image: NetworkImage("https://picsum.photos/seed/alex/800/800"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}