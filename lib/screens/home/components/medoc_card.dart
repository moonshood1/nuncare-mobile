import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/models/medecine.dart';

class MedocCard extends StatelessWidget {
  const MedocCard({required this.medecine, super.key});

  final Medecine medecine;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(
            medecine.img,
            height: 70,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            medecine.name,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: const Color.fromARGB(144, 0, 0, 0),
            ),
          ),
          Text(
            medecine.category,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
