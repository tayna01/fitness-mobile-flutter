import 'package:fitness_mobile_flutter/core/utils/app_colors.dart';
import 'package:fitness_mobile_flutter/widgets/card_field_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  final nomeController = TextEditingController(text: 'Tayná Vicente');
  final usernameController = TextEditingController(text: '@tayna_vicente01');
  final pesoController = TextEditingController();
  final alturaController = TextEditingController(text: '1.69');
  final idadeController = TextEditingController(text: '21');

  String? nomeError;
  String? pesoError;
  String? alturaError;
  String? idadeError;

  @override
  void dispose() {
    nomeController.dispose();
    usernameController.dispose();
    pesoController.dispose();
    alturaController.dispose();
    idadeController.dispose();
    super.dispose();
  }

  void salvar() {
    final nome = nomeController.text.trim();
    final peso = pesoController.text.trim();
    final altura = alturaController.text.trim();
    final idade = idadeController.text.trim();

    setState(() {
      nomeError = nome.isEmpty ? 'O nome é obrigatório' : null;
      pesoError = peso.isEmpty ? 'O peso é obrigatório' : null;
      alturaError = altura.isEmpty ? 'A altura é obrigatória' : null;
      idadeError = idade.isEmpty ? 'A idade é obrigatória' : null;
    });

    final tudoValido =
        nomeError == null &&
        pesoError == null &&
        alturaError == null &&
        idadeError == null;

    if (tudoValido) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Perfil atualizado com sucesso!'),
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
          'EDITAR PERFIL',
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
            // Avatar
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.surface,
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: AppColors.primary,
                ),
              ),
            ),

            const SizedBox(height: 30),

            buildFieldGroup(
              label: 'NOME COMPLETO: ',
              hint: 'Seu nome',
              controller: nomeController,
              errorText: nomeError,
              onChanged: (_) => setState(() => nomeError = null),
            ),

            const SizedBox(height: 20),

            buildFieldGroup(
              label: 'USERNAME: ',
              hint: '@seu_usuario',
              controller: usernameController,
            ),

            const SizedBox(height: 20),

            // Peso, Altura e Idade lado a lado
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: buildFieldGroup(
                    label: 'PESO (kg): ',
                    hint: '70',
                    controller: pesoController,
                    errorText: pesoError,
                    onChanged: (_) => setState(() => pesoError = null),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: buildFieldGroup(
                    label: 'ALTURA (m): ',
                    hint: '1.70',
                    controller: alturaController,
                    errorText: alturaError,
                    onChanged: (_) => setState(() => alturaError = null),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: buildFieldGroup(
                    label: 'IDADE: ',
                    hint: '25',
                    controller: idadeController,
                    errorText: idadeError,
                    onChanged: (_) => setState(() => idadeError = null),
                  ),
                ),
              ],
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
                  'SALVAR ALTERAÇÕES',
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
