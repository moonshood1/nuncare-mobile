import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/data/articles.dart';
import 'package:nuncare/data/medecines.dart';
import 'package:nuncare/screens/diary/diary_screen.dart';
import 'package:nuncare/screens/home/components/article_card.dart';
import 'package:nuncare/screens/home/components/medoc_card.dart';
import 'package:nuncare/screens/medecines/medecines_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.goToAnnuary});

  final void Function() goToAnnuary;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 52, 51, 51),
                      ),
                      "Trouvez tous les experts de santé",
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Center(
                      child: Icon(
                        Icons.location_on,
                        size: 32,
                        color: Color.fromARGB(255, 52, 51, 51),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {},
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                  hintText: "Recherchez un medecin",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: primarygreen,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: primarygreen),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: primarygreen.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // errorText: _errorText,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/add_1.png',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Center(
                        child: Text(
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          "Espace publicitaire",
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ]),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MedecinesScreen(medecines: medecines),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Medicaments assurés",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 52, 51, 51),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: primarygreen,
                        decoration: TextDecoration.underline,
                      ),
                      "Voir tout",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
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
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DiaryScreen(
                        articles: articles,
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Le Journal",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 52, 51, 51),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: primarygreen,
                          decoration: TextDecoration.underline),
                      "Voir tout",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: <Widget>[
                  ...articles
                      .where((article) => article.readingTime != "7")
                      .map((article) => ArticleCard(article: article))
                      .toList(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
