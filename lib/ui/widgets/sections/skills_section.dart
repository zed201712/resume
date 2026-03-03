import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants.dart';
import '../../../providers/language_provider.dart';
import '../../../models/resume_model.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeData = context.watch<LanguageProvider>().getResumeData(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

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
                  Flexible(
                    child: Text(
                      tr('skillsTitle'),
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

              // Content Grid
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Chart
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Container(
                      height: 400,
                      padding: const EdgeInsets.all(24),
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
                          Text(
                            tr('skillsLevel'),
                            style: GoogleFonts.notoSansTc(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(kTextColor),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Expanded(
                            child: _SkillsChartVertical(skills: resumeData.skills),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!isMobile) const SizedBox(width: 48),
                  if (isMobile) const SizedBox(height: 48),

                  // Categories
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      //children: ['Frontend', 'Backend', 'Tools', 'Soft Skills'].map((category) {
                      children: ['Frontend', 'Backend', 'Tools'].map((category) {
                        String titleKey;
                        switch (category) {
                          case 'Frontend': titleKey = 'skillsFrontend'; break;
                          case 'Backend': titleKey = 'skillsBackend'; break;
                          case 'Tools': titleKey = 'skillsTools'; break;
                          case 'Soft Skills': titleKey = 'skillsSoftSkills'; break;
                          default: titleKey = category;
                        }

                        return Container(
                          width: isMobile ? constraints.maxWidth : (constraints.maxWidth - 48) / 2 - 16, 
                          // Simple calculation for 2 columns in desktop part of Flex
                          constraints: const BoxConstraints(minWidth: 200),
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC), // Slate 50
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tr(titleKey),
                                style: GoogleFonts.notoSansTc(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(kTextColor),
                                ),
                              ),
                              const SizedBox(height: 16),
                              ...resumeData.skills
                                  .filter((s) => s.category == category)
                                  .map((skill) => Padding(
                                        padding: const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 4,
                                              height: 4,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFF818CF8), // Indigo 400
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                skill.name,
                                                style: GoogleFonts.notoSansTc(
                                                  fontSize: 14,
                                                  color: const Color(kSubTextColor),
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

extension ListFilter<T> on List<T> {
  List<T> filter(bool Function(T) test) {
    return where(test).toList();
  }
}

class _SkillsChartVertical extends StatelessWidget {
  final List<Skill> skills;

  const _SkillsChartVertical({required this.skills});

  @override
  Widget build(BuildContext context) {
    final data = skills
        .filter((s) => s.category != 'Soft Skills')
        .take(6)
        .toList();

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 100,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (_) => Colors.white,
            tooltipPadding: const EdgeInsets.all(8),
            tooltipMargin: 8,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '${data[groupIndex].name}\n',
                const TextStyle(
                  color: Color(kTextColor),
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '${rod.toY.toInt()}%',
                    style: const TextStyle(
                      color: Color(kPrimaryColor),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < data.length) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      data[index].name.split(' ').first, // Shorten name
                      style: const TextStyle(fontSize: 10, color: Color(kSubTextColor)),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        barGroups: data.asMap().entries.map((entry) {
          final index = entry.key;
          final skill = entry.value;
          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: skill.level.toDouble(),
                color: index % 2 == 0 ? const Color(kPrimaryColor) : const Color(kSecondaryColor),
                width: 16,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
