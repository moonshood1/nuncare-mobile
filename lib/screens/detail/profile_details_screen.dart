import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/user.dart';
import 'package:nuncare/screens/detail/components/profile_drawer.dart';
import 'package:nuncare/screens/message/user_messaging.dart';
import 'package:nuncare/screens/profile/common/row_content_widget.dart';
import 'package:nuncare/screens/profile/components/article_widget.dart';

class DetailsRootScreen extends StatelessWidget {
  const DetailsRootScreen({super.key, required this.doctor});

  final User doctor;

  @override
  Widget build(BuildContext context) {
    double coverHeight = 200;

    Widget experienceContent = Align(
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

    if (doctor.experiences.isNotEmpty) {
      experienceContent = Column(
        children: [
          ...doctor.experiences.map((e) => RowContentWidget(content: e))
        ],
      );
    }

    Widget skillContent = Column(
      children: [
        ...doctor.skills.map((e) => RowContentWidget(content: e)).toList(),
      ],
    );

    if (doctor.skills.isEmpty) {
      skillContent = Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Aucune compétence ajoutée",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w200,
          ),
        ),
      );
    }

    Widget articleContent = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final article in doctor.articles)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ProfileArticleCard(
                article: article,
              ),
            )
        ],
      ),
    );

    if (doctor.articles.isEmpty) {
      articleContent = Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Aucun article redigé",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w200,
          ),
        ),
      );
    }

    void sendMessage() async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => UserMessaging(recipient: doctor),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarygreen,
        elevation: 2,
      ),
      drawer: DetailProfileDrawer(
        sendMessage: () => sendMessage,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    "https://res.cloudinary.com/dhc0siki5/image/upload/v1674121263/medcy/2_bzsskt_k3glza.jpg",
                    fit: BoxFit.cover,
                    height: coverHeight,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: coverHeight - (coverHeight * 0.3)),
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(doctor.img),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${doctor.firstName} ${doctor.lastName}",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      doctor.speciality,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "A Propos",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    doctor.about == ''
                        ? "Aucune description ajoutée"
                        : doctor.about,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Expériences",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  experienceContent,
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Compétences",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  skillContent,
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Articles redigés",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  articleContent,
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
