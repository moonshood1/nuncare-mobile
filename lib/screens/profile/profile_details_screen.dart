import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/data/articles.dart';
import 'package:nuncare/models/article.dart';
import 'package:nuncare/providers/user_provider.dart';
import 'package:nuncare/screens/auth/login_screen.dart';
import 'package:nuncare/screens/detail/article_details_screen.dart';
import 'package:nuncare/screens/home/components/article_card.dart';

class ProfileDetailsScreen extends ConsumerWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails = ref.watch(userProvider);
    double coverHeight = 200;

    void disconnect() {
      ref.watch(userProvider.notifier).resetUser();
      // Navigator.pop(
      //   context,
      //   MaterialPageRoute(
      //     builder: (ctx) => LoginScreen(
      //       goToRegistration: () {},
      //     ),
      //   ),
      // );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green.shade200,
          content: const Text("Vous avez été deconnecté avec succès"),
          duration: const Duration(seconds: 5),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 60,
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Profil",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: disconnect,
                  icon: const Icon(Icons.logout),
                )
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/profile_cover.png",
                  fit: BoxFit.cover,
                  height: coverHeight,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin:
                      EdgeInsets.only(top: coverHeight - (coverHeight * 0.3)),
                  child: const Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/images/profil_3.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${userDetails.firstName} ${userDetails.lastName}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    userDetails.speciality,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "A Propos",
                  style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "OBH COMBI  is a cough medicine containing, Paracetamol,  used to relieve coughs accompanied by flu symptoms such as fever, headache, and sneezing",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Statistiques",
                  style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Privées pour vous",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "200 vues sur le profil",
                      style: GoogleFonts.poppins(color: Colors.grey),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "200 vues sur le profil",
                      style: GoogleFonts.poppins(color: Colors.grey),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "200 vues sur le profil",
                      style: GoogleFonts.poppins(color: Colors.grey),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Mes articles",
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
                  onPressed: () {},
                  label: Text(
                    "Créer un article",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: primarygreen,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 10,
                    children: <Widget>[
                      ...articles
                          .sublist(2, 4)
                          .map((e) => ProfileArticleCard(article: e))
                          .toList()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
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
                  onPressed: () {},
                  label: Text(
                    "Ajouter une expérience",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: primarygreen,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const ExperienceWidget(
                  image: "assets/images/work_1.png",
                  role: "Chef de département",
                  service: "Cardiologie",
                ),
                const ExperienceWidget(
                  image: "assets/images/work_2.png",
                  role: "Président de l'association",
                  service: "des medecins Abidjan Est",
                ),
                const SizedBox(
                  height: 25,
                ),
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
                  onPressed: () {},
                  label: Text(
                    "Ajouter une compétence",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: primarygreen,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SkillsRowWidget(
                  title: "Diagnostic et traitement des patients cardiaques",
                ),
                const SkillsRowWidget(
                  title: "Gestion des soins pré et post-opératoires",
                ),
                const SkillsRowWidget(
                  title: "Consultations ambulatoires",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SkillsRowWidget extends StatelessWidget {
  const SkillsRowWidget({super.key, required this.title});
  final String title;
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
              color: Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget(
      {super.key,
      required this.image,
      required this.role,
      required this.service});

  final String image, role, service;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: <Widget>[
          Container(
            height: 70,
            padding: const EdgeInsets.all(
              10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 2,
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
            child: Image.asset(image),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  role,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  service,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
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

class ProfileArticleCard extends StatelessWidget {
  const ProfileArticleCard({super.key, required this.article});

  // final String title, date, reaction, image;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailsScreen(article: article),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: 300,
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
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Image.asset(
                article.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              article.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 20,
              children: [
                Text(
                  article.createdAt,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  article.reactions,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
