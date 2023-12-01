import 'package:flutter/material.dart';
import 'package:nuncare/screens/auth/login_screen.dart';
import 'package:nuncare/screens/auth/registration_screen.dart';
import 'package:nuncare/screens/auth/slider_presentation.dart';
import 'package:nuncare/screens/auth/welcome_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  var activeScreen = "slider-screen";

  void goToSliderScreen() {
    setState(() {
      activeScreen = "slider-screen";
    });
  }

  void goToLoginScreen() {
    setState(() {
      activeScreen = "login-screen";
    });
  }

  void gotToRegisterScreen() {
    setState(() {
      activeScreen = "register-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    switch (activeScreen) {
      case "welcome-screen":
        screenWidget = WelcomeScreen(goToSliderScreen);
        break;
      case "login-screen":
        screenWidget = LoginScreen(
          goToRegistration: gotToRegisterScreen,
        );
        break;
      case "register-screen":
        screenWidget = RegistrationScreen(
          goToLogin: goToLoginScreen,
        );
        break;
      default:
        screenWidget = SliderScreen(
          goToLogin: goToLoginScreen,
          goToRegistration: gotToRegisterScreen,
        );
    }

    return Scaffold(
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
