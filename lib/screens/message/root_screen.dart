import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageRootScreen extends StatefulWidget {
  const MessageRootScreen({super.key});

  @override
  State<MessageRootScreen> createState() => _MessageRootScreenState();
}

class _MessageRootScreenState extends State<MessageRootScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "TO DO : Implementation du backend / service de messagerie",
            )
          ],
        ),
      ),
    );
  }
}
