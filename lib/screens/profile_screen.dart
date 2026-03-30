import 'package:fitness_mobile_flutter/core/utils/app_colors.dart';
import 'package:fitness_mobile_flutter/widgets/card_profile_options_widget.dart';
import 'package:fitness_mobile_flutter/widgets/card_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primary,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'MEU PERFIL',
          style: GoogleFonts.barlowCondensed(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.surface,
                    child: const Icon(
                      Icons.person,
                      size: 80,
                      color: AppColors.primary,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.primary,
                      child: const Icon(
                        Icons.edit,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Tayná Vicente',
              style: GoogleFonts.barlowCondensed(
                color: AppColors.textPrimary,
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              '@tayna_vicente01',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cardProfileWidget('PESO', '-'),
                cardProfileWidget('ALTURA', '1.69m'),
                cardProfileWidget('IDADE', '21'),
              ],
            ),

            const SizedBox(height: 40),

            cardProfileOptionsWidget(Icons.history, 'Histórico de Treinos'),
            cardProfileOptionsWidget(
              Icons.notifications_outlined,
              'Notificações',
            ),
            cardProfileOptionsWidget(Icons.shield_outlined, 'Privacidade'),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.logout, color: Colors.redAccent),
                label: const Text(
                  'SAIR DA CONTA',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
