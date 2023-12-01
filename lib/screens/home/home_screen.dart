import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/screens/home/components/article_card.dart';
import 'package:nuncare/screens/home/components/medoc_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  borderSide: BorderSide(color: primarygreen.withOpacity(0.5)),
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Medicaments assurés",
                  style: GoogleFonts.poppins(
                      fontSize: 17,
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
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  MedocCard(
                    image: "assets/images/med_1.png",
                    medocName: "Acétaminophène",
                    category: "Cardio",
                  ),
                  MedocCard(
                    image: "assets/images/med_2.png",
                    medocName: "Ciprofloxacine",
                    category: "Psycho",
                  ),
                  MedocCard(
                    image: "assets/images/med_3.png",
                    medocName: "Amoxicilline",
                    category: "Ortho",
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Le Journal",
                  style: GoogleFonts.poppins(
                      fontSize: 17,
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
            const SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const <Widget>[
                ArticleCard(
                  image: "assets/images/article_1.png",
                  title: "Article sur le SIDA",
                  author: "Dr Kra",
                  readingTime: 5,
                  createdAt: "10 Jun 2021",
                ),
                ArticleCard(
                  image: "assets/images/article_1.png",
                  title: "Article sur la nutrition",
                  author: "Dr Brou",
                  readingTime: 3,
                  createdAt: "11 May 2022",
                ),
                ArticleCard(
                  image: "assets/images/article_1.png",
                  title: "Les opérations chirurgicales",
                  author: "Dr Allah",
                  readingTime: 6,
                  createdAt: "07 Sep 2023",
                )
                // ProfileCard(
                //   picture: "assets/images/profil_1.png",
                //   name: "Dr Maria Elena",
                //   role: "Psychologue",
                //   stars: 4.7,
                //   position: 890.4,
                // ),
                // ProfileCard(
                //   picture: "assets/images/profil_2.png",
                //   name: "Dr Ortense Blé",
                //   role: "Cardiologue",
                //   stars: 4.3,
                //   position: 8.2,
                // ),
                // ProfileCard(
                //   picture: "assets/images/profil_1.png",
                //   name: "Dr Marc Yacé",
                //   role: "Dentiste",
                //   stars: 4.9,
                //   position: 290,
                // ),
                // ProfileCard(
                //   picture: "assets/images/profil_1.png",
                //   name: "Dr Marc Yacé",
                //   role: "Dentiste",
                //   stars: 4.9,
                //   position: 290,
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
