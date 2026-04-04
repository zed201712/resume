import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

import '../../../providers/language_provider.dart';
import '../../../utils/constants.dart';


class HeroSection extends StatelessWidget {
  final VoidCallback? onScrollToExperience;
  final VoidCallback? onScrollToProjects;

  const HeroSection({
    super.key,
    this.onScrollToExperience,
    this.onScrollToProjects,
  });

  @override
  Widget build(BuildContext context) {
    final resumeData = context.watch<LanguageProvider>().getResumeData(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final imageSize = Size(511, 767);
        final imageWidgetWidth = isMobile ? 280.0 : 300.0;
        final imageWidgetSize = Size(imageWidgetWidth, imageWidgetWidth * imageSize.height / imageSize.width);

        // Split bio into sections
        final bioParts = resumeData.bio.split('\n\n');

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
                    // Render bio in sections with buttons
                    ..._buildBioContent(bioParts, isMobile),
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
                        width: imageWidgetSize.width,
                        height: imageWidgetSize.height,
                        decoration: BoxDecoration(
                          color: const Color(kPrimaryColor).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(48),
                        ),
                      ),
                    ),
                    Container(
                      width: imageWidgetSize.width,
                      height: imageWidgetSize.height,
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
                          //image: NetworkImage("https://picsum.photos/seed/alex/800/800"),
                          image: AssetImage('assets/images/prof_image_001.png'),
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

  List<Widget> _buildBioContent(List<String> parts, bool isMobile) {
    List<Widget> content = [];
    
    for (int i = 0; i < parts.length; i++) {
      content.add(
        Text(
          parts[i],
          style: GoogleFonts.notoSansTc(
            fontSize: 18,
            color: const Color(kSubTextColor),
            height: 1.6,
          ),
        ),
      );

      // Section 2 is Experience (index 1)
      if (i == 1 && onScrollToExperience != null) {
        content.add(
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: _LinkButton(
              title: "navExperience".tr(),
              onTap: onScrollToExperience!,
            ),
          ),
        );
      }
      
      // Section 3 is Projects (index 2)
      if (i == 2 && onScrollToProjects != null) {
        content.add(
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: _LinkButton(
              title: "navProjects".tr(),
              onTap: onScrollToProjects!,
            ),
          ),
        );
      }

      if (i < parts.length - 1 && !((i == 1 && onScrollToExperience != null) || (i == 2 && onScrollToProjects != null))) {
        content.add(const SizedBox(height: 16));
      }
    }
    
    return content;
  }
}

class _LinkButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _LinkButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: const Color(kPrimaryColor),
        textStyle: GoogleFonts.notoSansTc(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          const SizedBox(width: 4),
          const Icon(LucideIcons.arrowRight, size: 16),
        ],
      ),
    );
  }
}