import 'package:fitness_mobile_flutter/core/utils/app_colors.dart';
import 'package:fitness_mobile_flutter/widgets/card_field_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({super.key});

  @override
  State<AddWorkoutScreen> createState() => AddWorkoutScreenState();
}

class AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final nomeController = TextEditingController();
  final duracaoController = TextEditingController();

  String? diaSelecionado;
  String? nomeError;
  String? duracaoError;
  String? diaError;

  final dias = ['SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SÁB', 'DOM'];

  @override
  void dispose() {
    nomeController.dispose();
    duracaoController.dispose();
    super.dispose();
  }

  void salvar() {
    final nome = nomeController.text.trim();
    final duracao = duracaoController.text.trim();

    setState(() {
      nomeError = nome.isEmpty ? 'O nome do treino é obrigatório' : null;
      duracaoError = duracao.isEmpty ? 'A duração é obrigatória' : null;
      diaError = diaSelecionado == null ? 'Selecione um dia' : null;
    });

    final tudoValido =
        nomeError == null && duracaoError == null && diaError == null;

    if (tudoValido) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Treino adicionado com sucesso!'),
          backgroundColor: AppColors.snackbarSuccess,
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primary,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'NOVO TREINO',
          style: GoogleFonts.barlowCondensed(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Seletor de dia
            Text(
              'DIA DA SEMANA: ',
              style: GoogleFonts.barlow(
                color: AppColors.textPrimary.withValues(alpha: 0.7),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: dias.map((dia) {
                final selecionado = diaSelecionado == dia;
                return GestureDetector(
                  onTap: () => setState(() {
                    diaSelecionado = dia;
                    diaError = null;
                  }),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: selecionado
                          ? AppColors.primary
                          : AppColors.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: diaError != null && !selecionado
                          ? Border.all(color: Colors.red)
                          : null,
                    ),
                    child: Text(
                      dia,
                      style: GoogleFonts.barlow(
                        color: selecionado
                            ? Colors.black
                            : AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            if (diaError != null)
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 2),
                child: Text(
                  diaError!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),

            const SizedBox(height: 24),

            buildFieldGroup(
              label: 'NOME DO TREINO: ',
              hint: 'Ex: PEITO + TRÍCEPS',
              controller: nomeController,
              errorText: nomeError,
              onChanged: (_) => setState(() => nomeError = null),
            ),

            const SizedBox(height: 20),

            buildFieldGroup(
              label: 'DURAÇÃO: ',
              hint: 'Ex: 50 min',
              controller: duracaoController,
              errorText: duracaoError,
              onChanged: (_) => setState(() => duracaoError = null),
            ),

            const SizedBox(height: 35),

            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: salvar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'SALVAR TREINO',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
