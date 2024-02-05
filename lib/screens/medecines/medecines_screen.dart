import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/screens/home/components/medoc_card.dart';

class MedecinesScreen extends StatelessWidget {
  const MedecinesScreen({super.key, required this.medecines});

  final List<dynamic> medecines;

  @override
  Widget build(BuildContext context) {
    Widget contentWidget = Align(
      alignment: Alignment.center,
      child: Text(
        "Aucun médicament assuré",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
      ),
    );

    if (medecines.isNotEmpty) {
      contentWidget = ListView.builder(
        itemCount: medecines.length,
        itemBuilder: (BuildContext ctx, int index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: MedocCard(
            medecine: medecines[index],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarygreen,
        centerTitle: false,
        elevation: 4,
        title: Text(
          "Les médicaments assurés",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: contentWidget,
      ),
    );
  }
}
