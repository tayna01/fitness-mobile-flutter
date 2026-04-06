import 'package:fitness_mobile_flutter/models/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_mobile_flutter/core/utils/app_colors.dart';
import 'package:fitness_mobile_flutter/routes/routes.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  static const List<NavItem> _items = [
    NavItem(label: 'INÍCIO', icon: Icons.home_rounded, route: AppRoutes.home),
    NavItem(
      label: 'TREINOS',
      icon: Icons.grid_view_rounded,
      route: AppRoutes.home,
    ),
    NavItem(
      label: 'PROG.',
      icon: Icons.bar_chart_rounded,
      route: AppRoutes.home,
    ),
    NavItem(
      label: 'PERFIL',
      icon: Icons.person_rounded,
      route: AppRoutes.profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: Color(0xFF1E1E1E), width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final isActive = index == selectedIndex;

            return GestureDetector(
              onTap: () => onTap(index),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      size: 24,
                      color: isActive
                          ? AppColors.primary
                          : const Color(0xFF555555),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: GoogleFonts.barlow(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                        color: isActive
                            ? AppColors.primary
                            : const Color(0xFF555555),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
