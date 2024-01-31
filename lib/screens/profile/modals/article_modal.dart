import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/services/user_service.dart';
import 'package:nuncare/shared/custom_input_field.dart';

class ArticleModal extends StatefulWidget {
  const ArticleModal({super.key});

  @override
  State<ArticleModal> createState() => _ArticleModalState();
}

class _ArticleModalState extends State<ArticleModal> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _contentController = TextEditingController();

  void submitArticle() async {
    try {
      BasicResponse response = await UserService().addArticle(
          _titleController.text,
          _descriptionController.text,
          _contentController.text);

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
                      "Rédaction d'un article",
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
                    hintText: "Titre de l'article",
                    icon: Icons.edit,
                    isHidden: false,
                    validator: (value) {
                      if ((value ?? '').length < 10) {
                        return 'Le titre doit avoir au moins 10 caractères';
                      }
                      return null;
                    },
                    isDate: false,
                    controller: _titleController,
                  ),
                  CustomTextField(
                    hintText: "Description de l'article",
                    icon: Icons.edit,
                    isHidden: false,
                    validator: (value) {
                      if ((value ?? '').length < 10) {
                        return 'La description doit avoir au moins 10 caractères';
                      }
                      return null;
                    },
                    isDate: false,
                    controller: _descriptionController,
                  ),
                  CustomTextField(
                    hintText: "Contenu de l'article",
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
                    controller: _contentController,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: ElevatedButton(
                      onPressed: submitArticle,
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
