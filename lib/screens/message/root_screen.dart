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
          children: <Widget>[
            Text(
              "Messages",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "TO DO : Implementation du backend / service de messagerie",
            )
          ],
        ),
      ),
    );
  }
}
