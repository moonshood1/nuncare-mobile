import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/screens/profile/common/row_content_widget.dart';

class SkillWidget extends StatelessWidget {
  const SkillWidget({
    super.key,
    required this.openSkillOverlay,
    required this.skills,
  });

  final void Function() openSkillOverlay;

  final List<dynamic> skills;

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      children: [
        ...skills.map((e) => RowContentWidget(content: e)).toList(),
      ],
    );

    if (skills.isEmpty) {
      content = Align(
        alignment: Alignment.center,
        child: Text(
          "Aucune compétence ajoutée",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
    }

    void removeSkill(int position) {}

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Compétences",
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
            onPressed: openSkillOverlay,
            label: Text(
              "Ajouter une compétence",
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: primarygreen,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          content,
        ],
      ),
    );
  }
}
