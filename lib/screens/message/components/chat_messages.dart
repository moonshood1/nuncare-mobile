import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "IMPLEMENTATION EN COURS . LIVRAISON : 27/03/2024",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
