import 'package:fitness_mobile_flutter/routes/routes.dart';
import 'package:fitness_mobile_flutter/screens/forgot_password_screen.dart';
import 'package:fitness_mobile_flutter/screens/login.dart';
import 'package:fitness_mobile_flutter/screens/profile_screen.dart';
import 'package:fitness_mobile_flutter/screens/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fit Trainer App',
      initialRoute: AppRoutes.login,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
        AppRoutes.profile: (context) => const ProfileScreen(),
        AppRoutes.forgotPassword: (context) => const ForgotPasswordScreen(),
      },
    );
  }
}
