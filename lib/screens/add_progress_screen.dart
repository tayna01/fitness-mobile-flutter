import 'package:fitness_mobile_flutter/core/utils/app_colors.dart';
import 'package:fitness_mobile_flutter/widgets/card_field_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProgressScreen extends StatefulWidget {
  const AddProgressScreen({super.key});

  @override
  State<AddProgressScreen> createState() => AddProgressScreenState();
}

class AddProgressScreenState extends State<AddProgressScreen> {
  final exercicioController = TextEditingController();
  final pesoController = TextEditingController();

  String? exercicioError;
  String? pesoError;
  String? categoriaSelecionada;

  final categorias = [
    'PEITO',
    'COSTAS',
    'PERNAS',
    'OMBRO',
    'BÍCEPS',
    'TRÍCEPS',
  ];

  @override
  void dispose() {
    exercicioController.dispose();
    pesoController.dispose();
    super.dispose();
  }

  void salvar() {
    final exercicio = exercicioController.text.trim();
    final peso = pesoController.text.trim();

    setState(() {
      exercicioError = exercicio.isEmpty ? 'O exercício é obrigatório' : null;
      pesoError = peso.isEmpty ? 'O peso é obrigatório' : null;
    });

    final tudoValido = exercicioError == null && pesoError == null;

    if (tudoValido) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Recorde adicionado com sucesso!'),
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
          'NOVO RECORDE',
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
            // Categoria
            Text(
              'CATEGORIA: ',
              style: GoogleFonts.barlow(
                color: AppColors.textPrimary.withValues(alpha: 0.7),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: categorias.map((cat) {
                final selecionado = categoriaSelecionada == cat;
                return GestureDetector(
                  onTap: () => setState(() => categoriaSelecionada = cat),
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
                    ),
                    child: Text(
                      cat,
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

            const SizedBox(height: 24),

            buildFieldGroup(
              label: 'EXERCÍCIO: ',
              hint: 'Ex: Supino Reto',
              controller: exercicioController,
              errorText: exercicioError,
              onChanged: (_) => setState(() => exercicioError = null),
            ),

            const SizedBox(height: 20),

            buildFieldGroup(
              label: 'PESO MÁXIMO (kg): ',
              hint: 'Ex: 100',
              controller: pesoController,
              errorText: pesoError,
              onChanged: (_) => setState(() => pesoError = null),
            ),

            const SizedBox(height: 20),

            // Preview do recorde
            if (exercicioController.text.isNotEmpty ||
                pesoController.text.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'PRÉVIA: ',
                      style: GoogleFonts.barlow(
                        color: AppColors.textSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        exercicioController.text.isEmpty
                            ? '—'
                            : exercicioController.text,
                        style: GoogleFonts.barlow(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      pesoController.text.isEmpty
                          ? '—'
                          : '${pesoController.text}kg',
                      style: GoogleFonts.barlowCondensed(
                        color: AppColors.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
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
                  'SALVAR RECORDE',
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
