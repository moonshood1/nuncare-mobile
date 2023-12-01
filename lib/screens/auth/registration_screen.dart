import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/shared/custom_input_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key, required this.goToLogin});

  final void Function() goToLogin;

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int index = 0;
  void goToLoginScreen() {
    widget.goToLogin();
  }

  List<Widget> registrationSteps = [
    const PersonalInformationWidget(),
    const ProfessionalInfosWidget(),
    const SecurityInformationsWidget(),
  ];

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
          registrationSteps[index],
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (index == 2) {
                    goToLoginScreen();
                  } else {
                    index += 1;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: primarygreen,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              child: Text(
                index != 2 ? "Continuer" : "Inscription",
                style: GoogleFonts.poppins(fontSize: 15),
              ),
            ),
          ),
          const Spacer(),
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
          const Spacer(),
        ],
      ),
    ));
  }
}

class PersonalInformationWidget extends StatelessWidget {
  const PersonalInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        CustomRadioGroup(
          radioItems: [
            CustomRadioItem(text: "Homme", value: "male"),
            CustomRadioItem(text: "Femme", value: "female")
          ],
          onChanged: (selectedValue) {
            print('Selected Value: $selectedValue');
          },
        ),
        CustomTextField(
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
          hintText: "Date de naissance",
          icon: Icons.calendar_today,
          isHidden: false,
          isDate: true,
          validator: (value) {
            const datePattern = r'^\d{2}/\d{2}/\d{4}$';
            final regExp = RegExp(datePattern);
            if (!regExp.hasMatch(value ?? '')) {
              return 'Format de date invalide. Utilisez JJ/MM/AAAA';
            }

            return null;
          },
        ),
        CustomTextField(
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

class ProfessionalInfosWidget extends StatefulWidget {
  const ProfessionalInfosWidget({super.key});

  @override
  State<ProfessionalInfosWidget> createState() =>
      _ProfessionalInfosWidgetState();
}

class _ProfessionalInfosWidgetState extends State<ProfessionalInfosWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> workDays = [
      "Lundi",
      "Mardi",
      // "Mecredi",
      // "Jeudi",
      // "Vendredi",
      // "Samedi",
      // "Dimanche"
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Text(
            "Informations Professionnelles",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        CustomTextField(
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
        const CustomSelectField(
          hintText: "Region d'exercice",
          selectedValue: "Lagunes",
          items: ['Lagunes', 'Montagnes', 'Savanes', 'Bas-sassandra'],
        ),
        const CustomSelectField(
          hintText: "Ville d'exercice",
          selectedValue: "Abidjan",
          items: ['Abidjan', 'Bouake', 'Yamoussoukro', 'San Pedro'],
        ),
        CustomTextField(
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
        const CustomSelectField(
          hintText: "Service d'exercice",
          selectedValue: "Cardiologie",
          items: ['Cardiologie', 'Général', 'Dentaire'],
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "Jour de travail",
          style: GoogleFonts.poppins(
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            ...workDays.map((e) => DayOfWorkSelectorWidget(day: e)).toList(),
          ],
        )
      ],
    );
  }
}

class SecurityInformationsWidget extends StatefulWidget {
  const SecurityInformationsWidget({super.key});

  @override
  State<SecurityInformationsWidget> createState() =>
      _SecurityInformationsWidgetState();
}

class _SecurityInformationsWidgetState
    extends State<SecurityInformationsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: 40,
        ),
        CustomTextField(
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
          hintText: "Mot de passe",
          icon: Icons.lock,
          isDate: false,
          isHidden: true,
          validator: (value) {
            if ((value ?? '').length < 10) {
              return 'Le mot de passe doit avoir au moins 10 caractères';
            }
            return null;
          },
        ),
        CustomTextField(
          hintText: "Confirmation du mot de passe",
          icon: Icons.lock,
          isDate: false,
          isHidden: true,
          validator: (value) {
            if ((value ?? '').length < 10) {
              return 'Le mot de passe doit avoir au moins 10 caractères';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class DayOfWorkSelectorWidget extends StatelessWidget {
  const DayOfWorkSelectorWidget({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: primarygreen),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          day,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
