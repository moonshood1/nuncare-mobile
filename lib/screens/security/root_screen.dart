import 'package:flutter/material.dart';
import 'package:nuncare/screens/security/confirmation_code_screen.dart';
import 'package:nuncare/screens/security/password_change_screen.dart';
import 'package:nuncare/screens/security/password_reset_screen.dart';

class SecurityRootScreen extends StatefulWidget {
  const SecurityRootScreen({super.key});

  @override
  State<SecurityRootScreen> createState() => _SecurityRootScreenState();
}

class _SecurityRootScreenState extends State<SecurityRootScreen> {
  var activeScreen = "password-reset-screen";
  var confirmationResetType = 0;

  void goToConfirmationScreen(int resetType) {
    setState(() {
      activeScreen = "confirmation-code-screen";
      confirmationResetType = resetType;
    });
  }

  void goToPasswordChange() {
    setState(() {
      activeScreen = "password-change-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    switch (activeScreen) {
      case "confirmation-code-screen":
        screenWidget = ConfirmationCodeScreen(
          resetType: confirmationResetType,
          goToPasswordChange: goToPasswordChange,
        );
        break;
      case "password-change-screen":
        screenWidget = const PasswordChangeScreen(
          data: "email",
        );
        break;
      default:
        screenWidget = PasswordResetScreen(
          goToConfirmation: goToConfirmationScreen,
        );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: screenWidget,
      ),
    );
  }
}
