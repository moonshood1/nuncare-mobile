import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/services/user_service.dart';
import 'package:nuncare/shared/custom_input_field.dart';

class ExperienceModal extends StatefulWidget {
  const ExperienceModal({super.key});

  @override
  State<ExperienceModal> createState() => _ExperienceModalState();
}

class _ExperienceModalState extends State<ExperienceModal> {
  final _experienceController = TextEditingController();

  void submitExperience() async {
    try {
      BasicResponse response =
          await UserService().addExperience(_experienceController.text.trim());

      if (!context.mounted) {
        return;
      }

      if (response.success) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green.shade200,
            content: Text(response.message),
            duration: const Duration(seconds: 4),
          ),
        );
      }

      return;
    } catch (e) {
      print(e);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade500,
          content: Text(e.toString()),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(
      builder: (ctx, constraints) {
        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Ajout d'une expérience",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: "Libellé de l'expérience",
                    icon: Icons.edit,
                    isHidden: false,
                    validator: (value) {
                      if ((value ?? '').length < 10) {
                        return 'Le libellé de  l\'expérience doit avoir au moins 10 caractères';
                      }
                      return null;
                    },
                    isDate: false,
                    controller: _experienceController,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: ElevatedButton(
                      onPressed: submitExperience,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: primarygreen,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        "Soumettre",
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
