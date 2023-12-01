import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.moveToNextScreen, {super.key});

  final void Function() moveToNextScreen;

  @override
  Widget build(BuildContext context) {
    const timeoutDuration = Duration(seconds: 3);
    Future.delayed(timeoutDuration, () {
      moveToNextScreen();
    });

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/logo_nuncare.png'),
            const SizedBox(
              height: 15,
            ),
            Image.asset('assets/images/title_nuncare.png')
          ],
        ),
      ),
    );
  }
}
