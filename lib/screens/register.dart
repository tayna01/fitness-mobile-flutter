import 'package:fitness_mobile_flutter/core/utils/app_colors.dart';
import 'package:fitness_mobile_flutter/routes/routes.dart';
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

            _buildFieldGroup(
              label: 'NOME COMPLETO: ',
              hint: 'Tayná Vicente Silva',
            ),
            const SizedBox(height: 20),

            _buildFieldGroup(label: 'USERNAME: ', hint: '@tayna_vicente01'),
            const SizedBox(height: 20),

            _buildFieldGroup(label: 'E-MAIL: ', hint: 'seu@email.com'),
            const SizedBox(height: 20),

            _buildFieldGroup(
              label: 'SENHA: ',
              hint: '••••••',
              isPassword: true,
            ),
            const SizedBox(height: 20),

            _buildFieldGroup(
              label: 'CONFIRME SUA SENHA: ',
              hint: '••••••',
              isPassword: true,
            ),

            const SizedBox(height: 35),

            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.login);
                },
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

            // DIVISOR
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

            // VOLTAR PARA LOGIN
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

  Widget _buildFieldGroup({
    required String label,
    required String hint,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.barlow(
            // Corrigido para ficar igual ao Login (suave com withValues)
            color: AppColors.textPrimary.withValues(alpha: 0.7),
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
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
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
