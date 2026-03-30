import 'package:fitness_mobile_flutter/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget cardProfileOptionsWidget(IconData icon, String title) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(12),
    ),
    child: ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      trailing: const Icon(Icons.chevron_right, color: AppColors.textSecondary),
      onTap: () {},
    ),
  );
}
