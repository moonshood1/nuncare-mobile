import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedocCard extends StatelessWidget {
  const MedocCard(
      {required this.image,
      required this.category,
      required this.medocName,
      super.key});

  final String image, medocName, category;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
      width: 170,
      height: 190,
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 70,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            medocName,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: const Color.fromARGB(144, 0, 0, 0),
            ),
          ),
          Text(
            category,
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
