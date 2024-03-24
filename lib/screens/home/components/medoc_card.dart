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
      child: Column(children: <Widget>[
        Image.network(
          medecine.img,
          height: 70,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          medecine.name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: const Color.fromARGB(144, 0, 0, 0),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              medecine.dci,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w200,
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
            Text(
              medecine.category,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w200,
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
