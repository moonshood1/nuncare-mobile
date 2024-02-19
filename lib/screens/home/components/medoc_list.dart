import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/data/medecines.dart';
import 'package:nuncare/screens/home/components/medoc_card.dart';

class MedocList extends StatelessWidget {
  const MedocList({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content = Align(
      alignment: Alignment.center,
      child: Text(
        "Aucun médicament assuré",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.w200,
        ),
      ),
    );

    if (medecines.isNotEmpty) {
      content = SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 10,
          children: <Widget>[
            ...medecines
                .sublist(0, 3)
                .map((medecine) => MedocCard(medecine: medecine))
                .toList()
          ],
        ),
      );
    }
    return content;
  }
}
