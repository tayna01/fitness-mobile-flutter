import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String label;
  final Color backgroundColor;
  final Color valueColor;
  final Color labelColor;

  const ProgressStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.label,
    required this.backgroundColor,
    required this.valueColor,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.barlow(
              color: labelColor,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: GoogleFonts.barlowCondensed(
                  color: valueColor,
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  height: 1,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: GoogleFonts.barlow(
                  color: labelColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
