import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/services/user_service.dart';
import 'package:nuncare/shared/custom_input_field.dart';

class PasswordEditscreen extends StatefulWidget {
  const PasswordEditscreen({super.key});

  @override
  State<PasswordEditscreen> createState() => _PasswordEditscreenState();
}

class _PasswordEditscreenState extends State<PasswordEditscreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _repeatedPasswordController = TextEditingController();
  var _isLoading = false;

  void editPassword() async {
    try {
      setState(() {
        _isLoading = true;
      });

      BasicResponse response = await UserService().editPassword(
          _oldPasswordController.text.trim(),
          _newPasswordController.text.trim());

      if (!context.mounted) {
        return;
      }

      if (response.success) {
        setState(() {
          _isLoading = false;
        });

        Navigator.of(context).pop(true);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green.shade200,
          content: Text(response.message),
          duration: const Duration(seconds: 4),
        ),
      );

      return;
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Modification du mot de passe",
        ),
        backgroundColor: primarygreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: const Color.fromARGB(255, 52, 51, 51),
                ),
                "Modifiez votre mot de passe dans cette section",
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                controller: _oldPasswordController,
                hintText: "Mot de passe actuel",
                icon: Icons.lock,
                isDate: false,
                isHidden: true,
                validator: (value) {
                  if ((value ?? '').length < 6) {
                    return 'Le mot de passe doit avoir au moins 6 caractères';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: _newPasswordController,
                hintText: "Nouveau mot de passe",
                icon: Icons.lock,
                isDate: false,
                isHidden: true,
                validator: (value) {
                  if ((value ?? '').length < 6) {
                    return 'Le mot de passe doit avoir au moins 6 caractères';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: _repeatedPasswordController,
                hintText: "Confirmation du mot de passe",
                icon: Icons.lock,
                isDate: false,
                isHidden: true,
                validator: (value) {
                  if ((value ?? '').length < 6) {
                    return 'Le mot de passe doit avoir au moins 6 caractères';
                  }

                  if (_newPasswordController.text.isNotEmpty &&
                      value != _newPasswordController.text.trim()) {
                    return 'Les deux mots de passe ne sont pas identiques';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: _isLoading ? null : editPassword,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: primarygreen,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  "Modifier",
                  style: GoogleFonts.poppins(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
