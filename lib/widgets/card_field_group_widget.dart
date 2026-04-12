import 'package:fitness_mobile_flutter/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildFieldGroup({
  required String label,
  required String hint,
  bool isPassword = false,
  TextEditingController? controller,
  String? errorText,
  void Function(String)? onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.barlow(
          color: AppColors.textPrimary.withValues(alpha: 0.7),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 8),

      TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: isPassword,
        style: const TextStyle(color: AppColors.textPrimary),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
          filled: true,
          fillColor: AppColors.surface,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: errorText != null
                ? const BorderSide(color: Colors.red)
                : BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: errorText != null
                ? const BorderSide(color: Colors.red)
                : BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: errorText != null
                ? const BorderSide(color: Colors.red)
                : const BorderSide(color: AppColors.primary),
          ),
        ),
      ),

      if (errorText != null)
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 2),
          child: Text(
            errorText,
            style: const TextStyle(color: Colors.red, fontSize: 12),
          ),
        ),
    ],
  );
}
