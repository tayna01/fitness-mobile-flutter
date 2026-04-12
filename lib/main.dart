import 'package:fitness_mobile_flutter/routes/routes.dart';
import 'package:fitness_mobile_flutter/screens/add_progress_screen.dart';
import 'package:fitness_mobile_flutter/screens/add_workout_screen.dart';
import 'package:fitness_mobile_flutter/screens/edit_profile_screen.dart';
import 'package:fitness_mobile_flutter/screens/forgot_password_screen.dart';
import 'package:fitness_mobile_flutter/screens/login_screen.dart';
import 'package:fitness_mobile_flutter/screens/main_page.dart';
import 'package:fitness_mobile_flutter/screens/register_screen.dart';
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
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
        AppRoutes.forgotPassword: (context) => const ForgotPasswordScreen(),
        AppRoutes.home: (context) => const MainPage(),
        AppRoutes.addWorkout: (context) => const AddWorkoutScreen(),
        AppRoutes.editProfile: (context) => const EditProfileScreen(),
        AppRoutes.addProgress: (context) => const AddProgressScreen(),
      },
    );
  }
}
