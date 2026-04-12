import 'package:fitness_mobile_flutter/core/utils/app_colors.dart';
import 'package:fitness_mobile_flutter/routes/routes.dart';
import 'package:fitness_mobile_flutter/widgets/card_field_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final nomeController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();

  String? nomeError;
  String? usernameError;
  String? emailError;
  String? senhaError;
  String? confirmarSenhaError;

  @override
  void dispose() {
    nomeController.dispose();
    usernameController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confirmarSenhaController.dispose();
    super.dispose();
  }

  Future<void> validarECadastrar() async {
    final nome = nomeController.text.trim();
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final senha = senhaController.text.trim();
    final confirmarSenha = confirmarSenhaController.text.trim();

    setState(() {
      nomeError = nome.isEmpty ? 'O nome é obrigatório' : null;

      usernameError = username.isEmpty ? 'O username é obrigatório' : null;

      if (email.isEmpty) {
        emailError = 'O e-mail é obrigatório';
      } else if (!email.contains('@') || !email.contains('.')) {
        emailError = 'Digite um e-mail válido';
      } else {
        emailError = null;
      }

      if (senha.isEmpty) {
        senhaError = 'A senha é obrigatória';
      } else if (senha.length < 6) {
        senhaError = 'A senha deve ter no mínimo 6 caracteres';
      } else {
        senhaError = null;
      }

      if (confirmarSenha.isEmpty) {
        confirmarSenhaError = 'Confirme sua senha';
      } else if (confirmarSenha != senha) {
        confirmarSenhaError = 'As senhas não coincidem';
      } else {
        confirmarSenhaError = null;
      }
    });

    final tudoValido =
        nomeError == null &&
        usernameError == null &&
        emailError == null &&
        senhaError == null &&
        confirmarSenhaError == null;
    if (tudoValido) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Conta criada com sucesso!'),
          backgroundColor: AppColors.snackbarSuccess,
          duration: const Duration(seconds: 2),
        ),
      );

      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;

      Navigator.pushNamed(context, AppRoutes.home);
    }
  }

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
              controller: nomeController,
              errorText: nomeError,
              onChanged: (_) => setState(() => nomeError = null),
            ),
            const SizedBox(height: 20),

            buildFieldGroup(
              label: 'USERNAME: ',
              hint: '@tayna_vicente01',
              controller: usernameController,
              errorText: usernameError,
              onChanged: (_) => setState(() => usernameError = null),
            ),
            const SizedBox(height: 20),

            buildFieldGroup(
              label: 'E-MAIL: ',
              hint: 'seu@email.com',
              controller: emailController,
              errorText: emailError,
              onChanged: (_) => setState(() => emailError = null),
            ),
            const SizedBox(height: 20),

            buildFieldGroup(
              label: 'SENHA: ',
              hint: '••••••',
              isPassword: true,
              controller: senhaController,
              errorText: senhaError,
              onChanged: (_) => setState(() => senhaError = null),
            ),
            const SizedBox(height: 20),

            buildFieldGroup(
              label: 'CONFIRME SUA SENHA: ',
              hint: '••••••',
              isPassword: true,
              controller: confirmarSenhaController,
              errorText: confirmarSenhaError,
              onChanged: (_) => setState(() => confirmarSenhaError = null),
            ),
            const SizedBox(height: 35),

            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: validarECadastrar,
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
