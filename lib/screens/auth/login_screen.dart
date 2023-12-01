import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/screens/home/root_screen.dart';
import 'package:nuncare/screens/security/root_screen.dart';
import 'package:nuncare/shared/custom_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.goToRegistration});

  final void Function() goToRegistration;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void goToRegistration() {
    widget.goToRegistration();
  }

  void checkDataAndProceed() {
    // recuperer les données saisies dans les deux inputs

    // verifier si elles sont valides ou existent dans la BD

    // si ok , rediriger vers la page finale

    // si non afficher un message d'erreur
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              "assets/images/logo_nuncare.png",
              width: 60,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Connectez-vous à votre compte",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextField(
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
            CustomTextField(
              hintText: "Mot de passe",
              icon: Icons.lock,
              isHidden: true,
              isDate: false,
              validator: (value) {
                if ((value ?? '').length < 6) {
                  return 'Le mot de passe doit contenir au moins 6 caractères';
                }
                return null;
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecurityRootScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Mot de passe oublié ?",
                    style: TextStyle(color: primarygreen),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeRootScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: primarygreen,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: Text(
                  "Connexion",
                  style: GoogleFonts.poppins(fontSize: 15),
                ),
              ),
            ),
            const Spacer(),
            Text(
              "Vous n'avez pas de compte ? ",
              style: GoogleFonts.poppins(),
            ),
            TextButton(
              onPressed: goToRegistration,
              child: Text(
                "Créer un compte",
                style: GoogleFonts.poppins(color: primarygreen),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
