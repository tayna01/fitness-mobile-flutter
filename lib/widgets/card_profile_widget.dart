import 'package:fitness_mobile_flutter/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cardProfileWidget(String label, String value) {
  return Container(
    width: 90,
    padding: const EdgeInsets.symmetric(vertical: 15),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Text(
          label,
          style: GoogleFonts.barlow(
            color: AppColors.textSecondary,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
