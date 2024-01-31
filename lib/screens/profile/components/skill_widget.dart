import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';

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
        ...skills.map((e) => SkillsRowWidget(skill: e)).toList(),
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Compétences",
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
                onPressed: openSkillOverlay,
                label: Text(
                  "Ajouter une compétence",
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

class SkillsRowWidget extends StatelessWidget {
  const SkillsRowWidget({super.key, required this.skill});
  final String skill;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              skill,
              style: GoogleFonts.poppins(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
