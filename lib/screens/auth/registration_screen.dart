// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/services/auth_service.dart';
import 'package:nuncare/shared/custom_input_field.dart';

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
  final _regionController = TextEditingController();
  final _specialityController = TextEditingController();
  final _cityController = TextEditingController();
  var _isLoading = false;

  void goToLoginScreen() {
    widget.goToLogin();
  }

  void register() async {
    try {
      setState(() {
        _isLoading = true;
      });
      Map<String, String> userData = {
        'firstName': _firstNameController.text.trim(),
        'lastName': _lastNameController.text.trim(),
        'phoneNumber': _phoneController.text.trim(),
        'orderNumber': _orderNumberController.text.trim(),
        'region': _regionController.text.trim(),
        'city': _cityController.text.trim(),
        'speciality': _specialityController.text.trim(),
        'medialCenter': _medicalCenterController.text.trim(),
        'email': _emailController.text.trim(),
        'password': _passwordController.text.trim()
      };

      BasicResponse response = await AuthService().register(userData);

      if (response.success) {
        setState(() {
          _isLoading = false;
        });
        goToLoginScreen();
      }

      if (!context.mounted) {
        return;
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

  void checkPersonalValues() {
    if (_firstNameController.text == '' ||
        _lastNameController.text == '' ||
        _phoneController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade500,
          content: const Text(
              'Vous devez remplir toutes les informations personnelles de avant de passer à l\'étape suivante'),
          duration: const Duration(seconds: 2),
        ),
      );

      return;
    }
    setState(() => currentStep += 1);
  }

  void checkProValues() {
    if (_orderNumberController.text == '' ||
        _regionController.text == '' ||
        _cityController.text == '' ||
        _medicalCenterController.text == '' ||
        _specialityController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade500,
          content: const Text(
              'Vous devez remplir toutes les informations professionnelles avant de passer à l\'étape suivante'),
          duration: const Duration(seconds: 2),
        ),
      );

      return;
    }
    setState(() => currentStep += 1);
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
                    } else if (currentStep == 0) {
                      checkPersonalValues();
                    } else if (currentStep == 1) {
                      checkProValues();
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
                              currentStep != 3 ? "Continuer" : "Soumettre",
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
                        "",
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
                            hintText: "Numéro de téléphone",
                            icon: Icons.phone,
                            isHidden: false,
                            isDate: false,
                            validator: (value) {
                              const phonePattern = r'^\+\d{13}$';
                              final regExp = RegExp(phonePattern);
                              if (!regExp.hasMatch(value ?? '')) {
                                return 'Format invalide (Ex: +2250101010101)';
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
                      title: const Text(""),
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
                            maxLength: 5,
                            validator: (value) {
                              if (value == '') {
                                return 'Le numéro doit avoir au moins 1 caractère';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            controller: _regionController,
                            hintText: "Région d'exercice",
                            icon: Icons.map,
                            isHidden: false,
                            isDate: false,
                            validator: (value) {
                              if ((value ?? '').length < 3) {
                                return 'La region doit avoir au moins 3 caractères';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            controller: _cityController,
                            hintText: "Ville d'exercice",
                            icon: Icons.location_city,
                            isHidden: false,
                            isDate: false,
                            validator: (value) {
                              if ((value ?? '').length < 3) {
                                return 'La ville doit avoir au moins 3 caractères';
                              }
                              return null;
                            },
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
                          CustomTextField(
                            controller: _specialityController,
                            hintText: "Spécialité",
                            icon: Icons.file_copy,
                            isHidden: false,
                            isDate: false,
                            validator: (value) {
                              if ((value ?? '').length < 5) {
                                return 'La specialité doit avoir au moins 5 caractères';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Step(
                      isActive: currentStep >= 2,
                      title: const Text(""),
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
                    ),
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
