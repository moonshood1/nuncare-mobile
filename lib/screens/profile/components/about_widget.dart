import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget(
      {super.key, required this.openAboutOverlay, required this.aboutText});

  final void Function() openAboutOverlay;
  final String aboutText;

  @override
  Widget build(BuildContext context) {
    Widget content = Text(
      aboutText,
      style: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    );

    if (aboutText == '') {
      content = Align(
        alignment: Alignment.center,
        child: Text(
          "Aucune  description ajoutée",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "A Propos",
                style: GoogleFonts.poppins(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton.icon(
                icon: const Icon(
                  Icons.edit,
                  color: primarygreen,
                ),
                onPressed: aboutText == '' ? openAboutOverlay : () {},
                label: Text(
                  aboutText == ''
                      ? "Ajouter une description"
                      : "Modifier la description",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: primarygreen,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          content,
        ],
      ),
    );
  }
}
