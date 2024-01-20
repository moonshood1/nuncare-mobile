import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/constants/api.dart';
import 'package:nuncare/data/resources.dart';
import 'package:nuncare/screens/auth/login_screen.dart';
import 'package:nuncare/shared/custom_input_field.dart';
import 'package:http/http.dart' as http;

final formatter = DateFormat.yMd();

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen(
      {super.key, required this.goToLogin, required this.goToRegistration});

  final void Function() goToLogin;
  final void Function() goToRegistration;

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int currentStep = 0;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _orderNumberController = TextEditingController();
  final _medicalCenterController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatedPasswordController = TextEditingController();
  String _selectedRegion = regions[0];
  String _selectedCity = cities[0];
  String _selectedSpeciality = specialities[0];

  void goToLoginScreen() {
    widget.goToLogin();
  }

  void register() async {
    final url = Uri.parse("$baseUrl/auth/register");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'firstName': _firstNameController.text.trim(),
          'lastName': _lastNameController.text.trim(),
          'phoneNumber': _phoneController.text.trim(),
          'orderNumber': _orderNumberController.text.trim(),
          'region': _selectedRegion.trim(),
          'city': _selectedCity.trim(),
          'speciality': _selectedSpeciality.trim(),
          'medialCenter': _medicalCenterController.text.trim(),
          'email': _emailController.text.trim(),
          'password': _passwordController.text.trim()
        },
      ),
    );

    final Map<String, dynamic> responseData = json.decode(response.body);
    String message = responseData['message'];

    if (!context.mounted) {
      return;
    }

    if (response.statusCode == 200) {
      goToLoginScreen();
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
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _orderNumberController.dispose();
    _medicalCenterController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatedPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            // const SizedBox(height: 30),
            // Image.asset(
            //   "assets/images/logo_nuncare.png",
            //   width: 60,
            // ),
            // const SizedBox(height: 30),
            // Text(
            //   "Inscrivez-vous sur Nuncare",
            //   textAlign: TextAlign.center,
            //   style: GoogleFonts.poppins(
            //     color: Colors.black,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 25,
            //   ),
            // ),
            const SizedBox(height: 30),
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(primary: primarygreen),
                ),
                child: Stepper(
                  currentStep: currentStep,
                  type: StepperType.horizontal,
                  onStepContinue: () {
                    if (currentStep == 2) {
                      register();
                    } else {
                      setState(() => currentStep += 1);
                    }
                  },
                  onStepCancel: currentStep == 0
                      ? null
                      : () => setState(() => currentStep -= 1),
                  controlsBuilder: (context, details) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Wrap(
                        spacing: 20,
                        children: [
                          ElevatedButton(
                            onPressed: details.onStepContinue,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: primarygreen,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              currentStep != 2 ? "Continuer" : "Soumettre",
                              style: GoogleFonts.poppins(fontSize: 15),
                            ),
                          ),
                          if (currentStep != 0)
                            TextButton(
                              onPressed: details.onStepCancel,
                              child: const Text("Retour"),
                            ),
                        ],
                      ),
                    );
                  },
                  steps: <Step>[
                    Step(
                      state: currentStep > 0
                          ? StepState.complete
                          : StepState.indexed,
                      isActive: currentStep >= 0,
                      title: const Text(
                        "Etape 1",
                      ),
                      // subtitle: const Text("Informations personnelles"),
                      content: Column(
                        children: <Widget>[
                          Text(
                            "Identification personnelle",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomTextField(
                            controller: _lastNameController,
                            hintText: "Nom",
                            icon: Icons.person,
                            isHidden: false,
                            isDate: false,
                            validator: (value) {
                              if ((value ?? '').length < 3) {
                                return 'Le nom doit avoir au moins 3 caractères';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            controller: _firstNameController,
                            hintText: "Prénoms",
                            icon: Icons.person,
                            isHidden: false,
                            isDate: false,
                            validator: (value) {
                              if ((value ?? '').length < 3) {
                                return 'Le prénom doit avoir au moins 3 caractères';
                              }
                              return null;
                            },
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
                      ),
                    ),
                    Step(
                      state: currentStep > 1
                          ? StepState.complete
                          : StepState.indexed,
                      isActive: currentStep >= 1,
                      title: const Text("Etape 2"),
                      // subtitle: const Text(
                      //   "Informations professionnelles",
                      // ),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Informations Professionnelles",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            controller: _orderNumberController,
                            hintText: "Numéro d'ordre",
                            icon: Icons.file_copy,
                            isHidden: false,
                            isDate: false,
                            validator: (value) {
                              if ((value ?? '').length < 8) {
                                return 'Le numéro doit avoir au moins 8 caractères';
                              }
                              return null;
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: primarygreen, width: 0.7),
                            ),
                            child: DropdownButton(
                              style: GoogleFonts.poppins(
                                  color: Colors.grey, fontSize: 14),
                              isExpanded: true,
                              focusColor: primarygreen,
                              underline: const SizedBox(),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: primarygreen,
                              ),
                              hint: const Text("Region d'exercice"),
                              value: _selectedRegion,
                              items: regions
                                  .map(
                                    (region) => DropdownMenuItem(
                                      value: region,
                                      child: Text(
                                        region.toUpperCase(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                if (value == null) {
                                  return;
                                }
                                setState(() {
                                  _selectedRegion = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: primarygreen, width: 0.7),
                            ),
                            child: DropdownButton(
                              style: GoogleFonts.poppins(
                                  color: Colors.grey, fontSize: 14),
                              isExpanded: true,
                              focusColor: primarygreen,
                              underline: const SizedBox(),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: primarygreen,
                              ),
                              hint: const Text("Ville d'exercice"),
                              value: _selectedCity,
                              items: cities
                                  .map(
                                    (city) => DropdownMenuItem(
                                      value: city,
                                      child: Text(
                                        city.toUpperCase(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                if (value == null) {
                                  return;
                                }
                                setState(() {
                                  _selectedCity = value;
                                });
                              },
                            ),
                          ),
                          CustomTextField(
                            controller: _medicalCenterController,
                            hintText: "Centre de santé d'exercice",
                            icon: Icons.medical_services,
                            isHidden: false,
                            isDate: false,
                            validator: (value) {
                              if ((value ?? '').length < 3) {
                                return 'Le centre de santé doit avoir au moins 3 caractères';
                              }
                              return null;
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: primarygreen, width: 0.7),
                            ),
                            child: DropdownButton(
                              style: GoogleFonts.poppins(
                                  color: Colors.grey, fontSize: 14),
                              isExpanded: true,
                              focusColor: primarygreen,
                              underline: const SizedBox(),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: primarygreen,
                              ),
                              hint: const Text("Specialité"),
                              value: _selectedSpeciality,
                              items: specialities
                                  .map(
                                    (speciality) => DropdownMenuItem(
                                      value: speciality,
                                      child: Text(
                                        speciality.toUpperCase(),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                if (value == null) {
                                  return;
                                }
                                setState(() {
                                  _selectedSpeciality = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Step(
                      isActive: currentStep >= 2,
                      title: const Text("Etape finale"),
                      // subtitle: const Text(
                      //   "Informations de sécurité",
                      // ),
                      content: Column(
                        children: <Widget>[
                          Text(
                            "Sécurité",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            controller: _emailController,
                            hintText: "Email",
                            icon: Icons.email,
                            isDate: false,
                            isHidden: false,
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

                              if (_passwordController.text.isNotEmpty &&
                                  value != _passwordController.text.trim()) {
                                return 'Les deux mots de passe ne sont pas identiques';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text(
              "Vous avez déjà un compte ? ",
              style: GoogleFonts.poppins(),
            ),
            TextButton(
              onPressed: goToLoginScreen,
              child: Text(
                "Se connecter",
                style: GoogleFonts.poppins(color: primarygreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
