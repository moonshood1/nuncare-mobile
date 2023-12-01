import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen(
      {super.key, required this.resetType, required this.goToPasswordChange});

  final int resetType;
  final void Function() goToPasswordChange;
  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  int index = 0;
  List<Widget> confirmationMethods = [
    const EmailConfirmationWidget(),
    const PhoneConfirmationWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    var type = widget.resetType;

    void goToPasswordScreen() {
      widget.goToPasswordChange();
    }

    final List<TextEditingController> controllers =
        List.generate(5, (index) => TextEditingController());

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            confirmationMethods[type],
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                (index) {
                  return SizedBox(
                    width: 60,
                    child: TextField(
                      cursorColor: primarygreen,
                      controller: controllers[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counter: const Offstage(),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: primarygreen,
                            width: 1.0,
                          ),
                        ),
                        focusColor: primarygreen,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    "Renvoyez le code dans ... ",
                    style: TextStyle(color: primarygreen),
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
                  onPressed: goToPasswordScreen,
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: primarygreen,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text(
                    "Confirmer",
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

class EmailConfirmationWidget extends StatefulWidget {
  const EmailConfirmationWidget({super.key});

  @override
  State<EmailConfirmationWidget> createState() =>
      _EmailConfirmationWidgetState();
}

class _EmailConfirmationWidgetState extends State<EmailConfirmationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Confirmez le code reçu par email",
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Veuillez saisir le code à 6 chiffres qui a été envoyé à exemple@gmail.com",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // CustomTextField(
        //   hintText: "Adresse email",
        //   icon: Icons.email,
        //   isHidden: false,
        //   isDate: false,
        //   validator: (value) {
        //     const emailPattern =
        //         r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
        //     final regExp = RegExp(emailPattern);
        //     if (!regExp.hasMatch(value ?? '')) {
        //       return 'Adresse e-mail invalide';
        //     }
        //     return null;
        //   },
        // ),
      ],
    );
  }
}

class PhoneConfirmationWidget extends StatefulWidget {
  const PhoneConfirmationWidget({super.key});

  @override
  State<PhoneConfirmationWidget> createState() =>
      _PhoneConfirmationWidgetState();
}

class _PhoneConfirmationWidgetState extends State<PhoneConfirmationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Confirmez le code reçu par téléphone",
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Veuillez saisir le code à 6 chiffres qui a été envoyé aux numéro +22507.......00",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
