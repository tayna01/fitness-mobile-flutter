import 'package:fitness_mobile_flutter/routes/routes.dart';
import 'package:fitness_mobile_flutter/widgets/workout_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_mobile_flutter/core/utils/app_colors.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => WorkoutsScreenState();
}

class WorkoutsScreenState extends State<WorkoutsScreen> {
  final List<Map<String, Object>> workouts = [
    {
      'day': 'SEG',
      'name': 'PEITO + TRÍCEPS',
      'duration': '50 min',
      'done': true,
    },
    {
      'day': 'TER',
      'name': 'COSTAS + BÍCEPS',
      'duration': '55 min',
      'done': true,
    },
    {'day': 'QUA', 'name': 'DESCANSO', 'duration': '10 min', 'done': true},
    {'day': 'QUI', 'name': 'PERNAS', 'duration': '60 min', 'done': false},
    {
      'day': 'SEX',
      'name': 'OMBRO + ABDÔMEN',
      'duration': '45 min',
      'done': false,
    },
    {'day': 'SÁB', 'name': 'CARDIO', 'duration': '30 min', 'done': false},
    {'day': 'DOM', 'name': 'DESCANSO', 'duration': '', 'done': false},
  ];

  void abrirAddWorkout() async {
    final novoTreino = await Navigator.pushNamed(context, AppRoutes.addWorkout);

    if (novoTreino != null) {
      setState(() => workouts.add(Map<String, Object>.from(novoTreino as Map)));

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Treino adicionado com sucesso!'),
          backgroundColor: AppColors.snackbarSuccess,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton(
        onPressed: abrirAddWorkout,
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TREINOS',
                style: GoogleFonts.barlowCondensed(
                  color: AppColors.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'SEMANA ATUAL',
                style: GoogleFonts.barlow(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: workouts.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (_, i) {
                    final work = workouts[i];

                    return WorkoutCard(
                      day: work['day'] as String,
                      name: work['name'] as String,
                      duration: work['duration'] as String,
                      isDone: work['done'] as bool,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
