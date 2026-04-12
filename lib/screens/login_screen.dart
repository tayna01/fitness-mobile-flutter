import 'package:fitness_mobile_flutter/core/utils/app_colors.dart';
import 'package:fitness_mobile_flutter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? userError;
  String? passwordError;
  bool obscurePassword = true;

  final List<Map<String, dynamic>> mockUsers = [
    {
      "username": "tayna.silva",
      "email": "tayna@ifpr.edu.br",
      "password": "123456",
    },
  ];

  void validateAndLogin() {
    final userIn = userController.text.trim();
    final passIn = passwordController.text.trim();

    setState(() {
      userError = null;
      passwordError = null;
    });

    if (userIn.isEmpty && passIn.isEmpty) {
      setState(() {
        userError = "O e-mail ou usuário é obrigatório";
        passwordError = "A senha é obrigatória";
      });
      return;
    }

    if (userIn.isEmpty) {
      setState(() => userError = "O e-mail ou usuário é obrigatório");
      return;
    }

    if (passIn.isEmpty) {
      setState(() => passwordError = "A senha é obrigatória");
      return;
    }

    Map<String, dynamic>? userFound;
    try {
      userFound = mockUsers.firstWhere(
        (u) => u["email"] == userIn || u["username"] == userIn,
      );
    } catch (_) {
      userFound = null;
    }

    if (userFound == null) {
      setState(() => userError = "Usuário não encontrado");
      return;
    }

    if (userFound["password"] != passIn) {
      setState(() => passwordError = "Senha incorreta");
      return;
    }

    Navigator.pushNamed(context, AppRoutes.home);
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'FIT',
                style: GoogleFonts.barlowCondensed(
                  color: AppColors.textPrimary,
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'TRAINER',
                style: GoogleFonts.barlowCondensed(
                  color: AppColors.primary,
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                  height: 0.9,
                ),
              ),
              const SizedBox(height: 40),

              buildLabel('E-MAIL OU USERNAME: '),
              const SizedBox(height: 8),
              TextField(
                controller: userController,
                style: const TextStyle(color: AppColors.textPrimary),
                onChanged: (_) => setState(() => userError = null),
                decoration: inputStyle(
                  'Digite seu e-mail ou usuário',
                  userError,
                ),
              ),
              if (userError != null) buildErrorMessage(userError!),

              const SizedBox(height: 20),

              buildLabel('SENHA: '),
              const SizedBox(height: 8),
              TextField(
                controller: passwordController,
                obscureText: obscurePassword,
                style: const TextStyle(color: AppColors.textPrimary),
                onChanged: (_) => setState(() => passwordError = null),
                decoration: inputStyle(
                  '••••••',
                  passwordError,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.textSecondary,
                      size: 20,
                    ),
                    onPressed: () =>
                        setState(() => obscurePassword = !obscurePassword),
                  ),
                ),
              ),
              if (passwordError != null) buildErrorMessage(passwordError!),

              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.forgotPassword),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Esqueci a senha',
                    style: TextStyle(
                      color: AppColors.primary.withValues(alpha: 0.8),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                height: 55,
                child: ElevatedButton(
                  onPressed: validateAndLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'ENTRAR',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              buildDivider(),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não tem conta?',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.register),
                    child: const Text(
                      'Criar conta',
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
      ),
    );
  }

  Widget buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.barlow(
        color: AppColors.textPrimary.withValues(alpha: 0.7),
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildErrorMessage(String message) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 2),
      child: Text(
        message,
        style: const TextStyle(color: Colors.red, fontSize: 12),
      ),
    );
  }

  InputDecoration inputStyle(
    String hint,
    String? errorText, {
    Widget? suffixIcon,
  }) {
    final hasError = errorText != null;
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
      filled: true,
      fillColor: AppColors.surface,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: hasError
            ? const BorderSide(color: Colors.red)
            : BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: hasError
            ? const BorderSide(color: Colors.red)
            : BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: hasError
            ? const BorderSide(color: Colors.red)
            : const BorderSide(color: AppColors.primary),
      ),
    );
  }

  Widget buildDivider() {
    return Row(
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
    );
  }
}
