import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Statistiques",
            style: GoogleFonts.poppins(
              color: Colors.black.withOpacity(0.7),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Aucune donnée statistique pour le moment",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          // Text(
          //   "Privées pour vous",
          //   style: GoogleFonts.poppins(
          //     color: Colors.grey,
          //     fontSize: 15,
          //     fontWeight: FontWeight.w400,
          //   ),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   children: [
          //     Container(
          //       height: 10,
          //       width: 10,
          //       decoration: BoxDecoration(
          //         color: Colors.grey,
          //         borderRadius: BorderRadius.circular(50),
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     Text(
          //       "200 vues sur le profil",
          //       style: GoogleFonts.poppins(color: Colors.grey),
          //     )
          //   ],
          // ),
          // Row(
          //   children: [
          //     Container(
          //       height: 10,
          //       width: 10,
          //       decoration: BoxDecoration(
          //         color: Colors.grey,
          //         borderRadius: BorderRadius.circular(50),
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     Text(
          //       "200 vues sur le profil",
          //       style: GoogleFonts.poppins(color: Colors.grey),
          //     )
          //   ],
          // ),
          // Row(
          //   children: [
          //     Container(
          //       height: 10,
          //       width: 10,
          //       decoration: BoxDecoration(
          //         color: Colors.grey,
          //         borderRadius: BorderRadius.circular(50),
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     Text(
          //       "200 vues sur le profil",
          //       style: GoogleFonts.poppins(color: Colors.grey),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
