import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/services/user_service.dart';
import 'package:nuncare/shared/custom_input_field.dart';

class AboutEditModal extends StatefulWidget {
  const AboutEditModal({super.key, required this.aboutText});

  final String aboutText;

  @override
  State<AboutEditModal> createState() => _AboutEditModalState();
}

class _AboutEditModalState extends State<AboutEditModal> {
  final _textAboutController = TextEditingController();

  @override
  void initState() {
    _textAboutController.text = widget.aboutText;
    super.initState();
  }

  void editAboutText() async {
    try {
      BasicResponse response =
          await UserService().editAbout(_textAboutController.text.trim());

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

  void deleteAboutText() async {
    try {
      BasicResponse response = await UserService().deleteAbout();

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
                      "Modification de la description",
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
                    hintText: "Contenu",
                    icon: Icons.edit,
                    isHidden: false,
                    maxLines: 10,
                    validator: (value) {
                      if ((value ?? '').length < 50) {
                        return 'Le contenu doit avoir au moins 50 caractères';
                      }
                      return null;
                    },
                    isDate: false,
                    controller: _textAboutController,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: editAboutText,
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
                        onPressed: deleteAboutText,
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
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
