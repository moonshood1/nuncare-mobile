import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/user.dart';
import 'package:nuncare/shared/custom_input_field.dart';

class ProfileModal extends StatefulWidget {
  const ProfileModal({super.key, required this.user});

  final User user;

  @override
  State<ProfileModal> createState() => _ProfileModalState();
}

class _ProfileModalState extends State<ProfileModal> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    User userDetails = widget.user;

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
                      "Modification du profil",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // CustomTextField(
                  //   hintText: "Nom",
                  //   icon: Icons.edit,
                  //   isHidden: false,
                  //   validator: (value) {
                  //     if ((value ?? '').length < 10) {
                  //       return 'Le titre doit avoir au moins 10 caractères';
                  //     }
                  //     return null;
                  //   },
                  //   isDate: false,
                  //   controller: _lastNameController,
                  // ),

                  TextField(
                    controller: _lastNameController,
                    style: GoogleFonts.poppins(),
                    decoration: InputDecoration(
                      hintText: userDetails.lastName,
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      // prefixIcon: Icon(
                      //   widget.icon,
                      //   color: primarygreen,
                      // ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: primarygreen),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: primarygreen),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),

                  // CustomTextField(
                  //   hintText: "Prénoms",
                  //   icon: Icons.edit,
                  //   isHidden: false,
                  //   validator: (value) {
                  //     if ((value ?? '').length < 10) {
                  //       return 'La description doit avoir au moins 10 caractères';
                  //     }
                  //     return null;
                  //   },
                  //   isDate: false,
                  //   controller: _firstNameController,
                  // ),
                  // CustomTextField(
                  //   hintText: "Contenu de l'article",
                  //   icon: Icons.edit,
                  //   isHidden: false,
                  //   maxLines: 10,
                  //   validator: (value) {
                  //     if ((value ?? '').length < 50) {
                  //       return 'Le contenu doit avoir au moins 50 caractères';
                  //     }
                  //     return null;
                  //   },
                  //   isDate: false,
                  //   controller: _contentController,
                  // ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: ElevatedButton(
                      onPressed: () {},
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
