import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/screens/profile/components/skill_widget.dart';

class XpWidget extends StatelessWidget {
  const XpWidget(
      {super.key, required this.openXpOverlay, required this.experiences});

  final void Function() openXpOverlay;
  final List<dynamic> experiences;

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      children: [
        ...experiences.map((e) => SkillsRowWidget(skill: e)).toList(),
      ],
    );

    // ListView.builder(
    //   itemCount: experiences.length,
    //   itemBuilder: (BuildContext ctx, int index) => Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: ExperienceWidget(
    //       experience: experiences[index],
    //     ),
    //   ),
    // );

    if (experiences.isEmpty) {
      content = Align(
        alignment: Alignment.center,
        child: Text(
          "Aucune expérience ajoutée",
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
                "Expériences",
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
                onPressed: openXpOverlay,
                label: Text(
                  "Ajouter une expérience",
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
          content
        ],
      ),
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({super.key, required this.experience});

  final String experience;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  experience,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
