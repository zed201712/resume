import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants.dart';
import '../../../providers/language_provider.dart';
import '../../../models/resume_model.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
                child: const Icon(LucideIcons.code, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                tr('projectsTitle'),
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

          // Projects Grid
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              int crossAxisCount = 1;
              if (width > 1024) {
                crossAxisCount = 3;
              } else if (width > 768) {
                crossAxisCount = 2;
              }

              double maxAspectRatio = 0.8;
              if (resumeData.projects.isNotEmpty) {
                maxAspectRatio = resumeData.projects
                    .map((p) => p.aspectRatio)
                    .reduce((a, b) => a < b ? a : b);
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                  childAspectRatio: maxAspectRatio,
                ),
                itemCount: resumeData.projects.length,
                itemBuilder: (context, index) {
                  return _ProjectCard(project: resumeData.projects[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(widget.project.link)),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.identity()..translate(0.0, _isHovered ? -8.0 : 0.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: const Color(0xFFF1F5F9)), // Slate 100
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.1 : 0.05),
                blurRadius: _isHovered ? 20 : 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image Area
              Expanded(
                flex: 5,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    widget.project.image.isNotEmpty
                        ? (widget.project.image.startsWith('http')
                            ? Image.network(
                                widget.project.image,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                widget.project.image,
                                fit: BoxFit.cover,
                              ))
                        : Container(
                            color: const Color(0xFFF1F5F9),
                            child: const Center(
                              child: Icon(LucideIcons.image, size: 48, color: Color(kSubTextColor)),
                            ),
                          ),
                    AnimatedOpacity(
                      opacity: _isHovered ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black54,
                              Colors.transparent,
                            ],
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(24),
                        child: InkWell(
                          onTap: () => launchUrl(Uri.parse(widget.project.link)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                tr('projectsViewDetails'),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(LucideIcons.externalLink, color: Colors.white, size: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Content Area
              Expanded(
                flex: 6, // Give slightly more space for text if needed
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.title,
                        style: GoogleFonts.notoSansTc(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isHovered ? const Color(kPrimaryColor) : const Color(kTextColor),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: Text(
                          widget.project.description,
                          style: GoogleFonts.notoSansTc(
                            fontSize: 14,
                            color: const Color(kSubTextColor),
                            height: 1.2,
                          ),
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.project.tags.map<Widget>((tag) => Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(kPrimaryColor).withOpacity(0.05),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                tag,
                                style: GoogleFonts.notoSansTc(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(kSecondaryColor), // Using secondary or primary light
                                  letterSpacing: 0.5,
                                ),
                              ),
                            )).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
