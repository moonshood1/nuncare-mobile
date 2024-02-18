import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/services/user_service.dart';
import 'package:nuncare/shared/custom_input_field.dart';

class ExperienceEditModal extends StatefulWidget {
  const ExperienceEditModal({
    super.key,
    required this.experience,
    required this.position,
  });

  final String experience;
  final int position;

  @override
  State<ExperienceEditModal> createState() => _ExperienceEditModalState();
}

class _ExperienceEditModalState extends State<ExperienceEditModal> {
  final _experienceController = TextEditingController();

  @override
  void initState() {
    _experienceController.text = widget.experience;
    super.initState();
  }

  void editExperience() async {
    try {
      BasicResponse response = await UserService()
          .editExperience(_experienceController.text.trim(), widget.position);

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

  void deleteExperience() async {
    try {
      BasicResponse response =
          await UserService().deleteExperience(widget.position);

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
                      "Modification d'une expérience",
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
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: editExperience,
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
                          "Modifier",
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: deleteExperience,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red.shade300,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Text(
                          "Supprimer",
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                      ),
                    ],
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
