import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_mobile_flutter/core/utils/app_colors.dart';

class WorkoutCard extends StatelessWidget {
  final String day;
  final String name;
  final String duration;
  final bool isDone;

  const WorkoutCard({
    super.key,
    required this.day,
    required this.name,
    required this.duration,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    bool isRest = duration == '';

    Color dayColor = isDone ? AppColors.primary : AppColors.textSecondary;

    Color nameColor = isRest ? AppColors.textSecondary : AppColors.textPrimary;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: isDone ? Border.all(color: AppColors.primary) : null,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            child: Text(
              day,
              style: GoogleFonts.barlowCondensed(
                color: dayColor,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: GoogleFonts.barlowCondensed(
                color: nameColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          if (!isRest)
            Text(
              duration,
              style: GoogleFonts.barlow(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),

          if (isDone) ...[
            const SizedBox(width: 10),
            const Icon(
              Icons.check_circle_rounded,
              size: 18,
              color: AppColors.primary,
            ),
          ],
        ],
      ),
    );
  }
}
