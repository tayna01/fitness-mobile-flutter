import 'package:fitness_mobile_flutter/core/utils/app_colors.dart';
import 'package:fitness_mobile_flutter/widgets/card_field_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'CRIE SUA',
              style: GoogleFonts.barlowCondensed(
                color: AppColors.textPrimary,
                fontSize: 60,
                fontWeight: FontWeight.w900,
                height: 0.9,
              ),
            ),
            Text(
              'CONTA',
              style: GoogleFonts.barlowCondensed(
                color: AppColors.primary,
                fontSize: 60,
                fontWeight: FontWeight.w900,
                height: 0.9,
              ),
            ),

            const SizedBox(height: 40),

            buildFieldGroup(
              label: 'NOME COMPLETO: ',
              hint: 'Tayná Vicente Silva',
            ),
            const SizedBox(height: 20),

            buildFieldGroup(label: 'USERNAME: ', hint: '@tayna_vicente01'),
            const SizedBox(height: 20),

            buildFieldGroup(label: 'E-MAIL: ', hint: 'seu@email.com'),
            const SizedBox(height: 20),

            buildFieldGroup(label: 'SENHA: ', hint: '••••••', isPassword: true),
            const SizedBox(height: 20),

            buildFieldGroup(
              label: 'CONFIRME SUA SENHA: ',
              hint: '••••••',
              isPassword: true,
            ),

            const SizedBox(height: 35),

            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'CADASTRAR',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                const Expanded(
                  child: Divider(color: AppColors.secondary, thickness: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'OU',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Expanded(
                  child: Divider(color: AppColors.secondary, thickness: 1),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Já tem conta?',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
