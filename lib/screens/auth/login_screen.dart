import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/constants/api.dart';
import 'package:nuncare/providers/user_provider.dart';
import 'package:nuncare/screens/home/root_screen.dart';
import 'package:nuncare/screens/security/root_screen.dart';
import 'package:nuncare/shared/custom_input_field.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key, required this.goToRegistration});

  final void Function() goToRegistration;

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void goToRegistration() {
    widget.goToRegistration();
  }

  void checkDataAndProceed() async {
    final url = Uri.parse("$baseUrl/auth/login");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'email': _emailController.text.trim(),
          'password': _passwordController.text.trim(),
        },
      ),
    );

    final Map<String, dynamic> responseData = json.decode(response.body);

    String message = responseData['message'];

    if (!context.mounted) {
      return;
    }

    if (response.statusCode == 200) {
      String token = responseData['token'];
      String id = responseData['id'];
      String firstName = responseData['firstName'];
      String lastName = responseData['lastName'];
      String phoneNumber = responseData['phoneNumber'];
      String orderNumber = responseData['orderNumber'];
      String city = responseData['city'];
      String speciality = responseData['speciality'];
      String medicalCenter = responseData['medicalCenter'];
      String email = responseData['email'];

      ref.watch(userProvider.notifier).setUser(
            id: id,
            token: token,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            orderNumber: orderNumber,
            city: city,
            speciality: speciality,
            medicalCenter: medicalCenter,
            email: email,
          );

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const HomeRootScreen(),
        ),
      );
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: response.statusCode != 200
            ? Colors.red.shade500
            : Colors.green.shade200,
        content: Text(message),
        duration: const Duration(seconds: 5),
      ),
    );

    return;
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
              child: Column(
                children: <Widget>[
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
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
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
                  CustomTextField(
                    controller: _passwordController,
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
                        child: Text(
                          "Mot de passe oublié ?",
                          style: GoogleFonts.poppins(color: primarygreen),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: ElevatedButton(
                      onPressed: checkDataAndProceed,
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
                  const SizedBox(
                    height: 20,
                  ),
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
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
