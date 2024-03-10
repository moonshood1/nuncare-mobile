import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/screens/profile/common/row_content_widget.dart';

class XpWidget extends StatelessWidget {
  const XpWidget({
    super.key,
    required this.openXpOverlay,
    required this.experiences,
    required this.openEditOverlay,
  });

  final void Function() openXpOverlay, openEditOverlay;

  final List<dynamic> experiences;

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      children: [
        ...experiences.map((e) => RowContentWidget(content: e)).toList(),
      ],
    );

    if (experiences.isEmpty) {
      content = Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Aucune expérience ajoutée",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w200,
          ),
        ),
      );
    }

    void removeExperience(int position) {}

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Expériences",
            style: GoogleFonts.poppins(
              color: Colors.black.withOpacity(0.7),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          TextButton.icon(
            icon: const Icon(
              Icons.add,
              color: primarygreen,
            ),
            onPressed: openXpOverlay,
            label: Text(
              "Ajouter une expérience",
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: primarygreen,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          content
        ],
      ),
    );
  }
}
