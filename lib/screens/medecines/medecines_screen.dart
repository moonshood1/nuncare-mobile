import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/models/medecine.dart';
import 'package:nuncare/screens/home/components/medoc_card.dart';

class MedecinesScreen extends StatelessWidget {
  const MedecinesScreen({super.key, required this.medecines});

  final List<Medecine> medecines;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        title: Text(
          "Les médicaments assurés",
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView.builder(
          itemCount: medecines.length,
          itemBuilder: (BuildContext ctx, int index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: MedocCard(
              medecine: medecines[index],
            ),
          ),
        ),
      ),
    );
  }
}
