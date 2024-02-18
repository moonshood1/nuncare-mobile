import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 2,
          offset: const Offset(0, 2),
          color: Colors.black.withOpacity(0.25),
        ),
      ]),
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          Image.network(""),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Titre de la notification',
            style: GoogleFonts.poppins(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Corps de la notification',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}
