import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/shared/custom_input_field.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key, required this.goToConfirmation});

  final void Function(int resetType) goToConfirmation;

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  int index = 0;
  List<Widget> passwordResetMethods = [
    const EmailResetMethodWidget(),
    const PhoneResetMethodWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    void goToConfirmationCodeScreen(int resetType) {
      widget.goToConfirmation(resetType);
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            passwordResetMethods[index],
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (index == 0) {
                        index += 1;
                      } else {
                        index -= 1;
                      }
                    });
                  },
                  child: Text(
                    index == 0
                        ? "ou renseignez numéro de téléphone"
                        : "ou renseignez votre email",
                    style: GoogleFonts.poppins(color: primarygreen),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: ElevatedButton(
                  onPressed: () => goToConfirmationCodeScreen(index),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: primarygreen,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text(
                    "Continuer",
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class EmailResetMethodWidget extends StatefulWidget {
  const EmailResetMethodWidget({super.key});

  @override
  State<EmailResetMethodWidget> createState() => _EmailResetMethodWidgetState();
}

class _EmailResetMethodWidgetState extends State<EmailResetMethodWidget> {
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Renseignez votre adresse mail",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Vous recevrez un code sur votre mail pour continuer",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: _emailController,
          hintText: "Adresse email",
          icon: Icons.email,
          isHidden: false,
          isDate: false,
          validator: (value) {
            const emailPattern =
                r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
            final regExp = RegExp(emailPattern);
            if (!regExp.hasMatch(value ?? '')) {
              return 'Adresse e-mail invalide';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class PhoneResetMethodWidget extends StatefulWidget {
  const PhoneResetMethodWidget({super.key});

  @override
  State<PhoneResetMethodWidget> createState() => _PhoneResetMethodWidgetState();
}

class _PhoneResetMethodWidgetState extends State<PhoneResetMethodWidget> {
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Renseignez votre numéro de téléphone",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Vous recevrez un code sur votre numéro pour continuer",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: _phoneController,
          hintText: "Téléphone",
          icon: Icons.phone,
          isHidden: false,
          isDate: false,
          validator: (value) {
            const phonePattern = r'^\+\d{13}$';
            final regExp = RegExp(phonePattern);
            if (!regExp.hasMatch(value ?? '')) {
              return 'Numéro de téléphone invalide';
            }
            return null;
          },
        ),
      ],
    );
  }
}
