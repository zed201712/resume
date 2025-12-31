import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants.dart';
import '../../../providers/language_provider.dart';
import '../../../models/resume_model.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
                child: const Icon(LucideIcons.mail, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                tr('contactTitle'),
                style: GoogleFonts.notoSansTc(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(kTextColor),
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

          // Contact Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(40), // md:p-20 ~ 80px, p-10 ~ 40px
            decoration: BoxDecoration(
              color: const Color(kPrimaryColor),
              borderRadius: BorderRadius.circular(48),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                // Background Decoration
                Positioned(
                  top: -80,
                  right: -80,
                  child: Container(
                    width: 256,
                    height: 256,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6366F1).withOpacity(0.5), // Indigo 500
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                 Positioned(
                  bottom: -80,
                  left: -80,
                  child: Container(
                    width: 256,
                    height: 256,
                    decoration: BoxDecoration(
                      color: const Color(kSecondaryColor).withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                // Content
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isDesktop = constraints.maxWidth > 768;
                    return Flex(
                      direction: isDesktop ? Axis.horizontal : Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left Info
                        Expanded(
                          flex: isDesktop ? 1 : 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tr('contactSubtitle'),
                                style: GoogleFonts.notoSansTc(
                                  fontSize: 32, // text-4xl
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                tr('contactDescription'),
                                style: GoogleFonts.notoSansTc(
                                  fontSize: 18,
                                  color: const Color(0xFFE0E7FF), // Indigo 100
                                ),
                              ),
                              const SizedBox(height: 40),
                              _ContactInfoItem(
                                icon: LucideIcons.mail,
                                label: tr('contactEmailLabel'),
                                value: resumeData.email,
                              ),
                              const SizedBox(height: 24),
                              _ContactInfoItem(
                                icon: LucideIcons.mapPin,
                                label: tr('contactLocationLabel'),
                                value: resumeData.location,
                              ),
                              if (!isDesktop) const SizedBox(height: 40),
                            ],
                          ),
                        ),
                        if (isDesktop) const SizedBox(width: 64),

                        // Right Form
                        Expanded(
                          flex: isDesktop ? 1 : 0,
                          child: Container(
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(color: Colors.white.withOpacity(0.2)),
                            ),
                            child: Column(
                              children: [
                                _ContactInput(
                                  label: tr('contactFormName'),
                                  placeholder: tr('contactFormNamePlaceholder'),
                                ),
                                const SizedBox(height: 24),
                                _ContactInput(
                                  label: tr('contactFormNeeds'),
                                  placeholder: tr('contactFormNeedsPlaceholder'),
                                  maxLines: 4,
                                ),
                                const SizedBox(height: 24),
                                SizedBox(
                                  width: double.infinity,
                                  height: 56,
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(LucideIcons.send, size: 20),
                                    label: Text(tr('contactButtonSend')),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: const Color(kPrimaryColor),
                                      textStyle: GoogleFonts.notoSansTc(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      elevation: 4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ContactInfoItem({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.notoSansTc(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFC7D2FE), // Indigo 200
                letterSpacing: 1.5,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.notoSansTc(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ContactInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final int maxLines;

  const _ContactInput({required this.label, required this.placeholder, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.notoSansTc(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            filled: true,
            fillColor: Colors.white.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.4), width: 2),
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}
