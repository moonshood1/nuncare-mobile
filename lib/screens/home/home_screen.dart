import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/ad.dart';
import 'package:nuncare/models/article.dart';
import 'package:nuncare/models/medecine.dart';
import 'package:nuncare/screens/diary/diary_screen.dart';
import 'package:nuncare/screens/home/components/diary_list.dart';
import 'package:nuncare/screens/home/components/medoc_list.dart';
import 'package:nuncare/screens/medecines/medecines_screen.dart';
import 'package:nuncare/services/resource_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var resourceService = ResourceService();

  List<Medecine> medecines = [];
  List<Ad> ads = [];
  List<Article> articles = [];

  @override
  void initState() {
    getMedecines();
    getAds();
    getArticles();
    super.initState();
  }

  void getMedecines() async {
    try {
      List<Medecine> response = await resourceService.getMedecines();

      setState(() {
        medecines = response;
      });
    } catch (error) {
      print(error);
    }
  }

  void getAds() async {
    try {
      List<Ad> response = await resourceService.getAds();

      setState(() {
        ads = response;
      });
    } catch (error) {
      print(error);
    }
  }

  void getArticles() async {
    try {
      List<Article> response = await resourceService.getArticles();

      setState(() {
        articles = response;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Accueil",
        ),
        backgroundColor: primarygreen,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
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
              Row(
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
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MedecinesScreen(medecines: medecines),
                      ),
                    ),
                    child: Text(
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: primarygreen,
                        decoration: TextDecoration.underline,
                      ),
                      "Voir tout",
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const MedocList(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Le Journal",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 52, 51, 51),
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    splashColor: primarygreen,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiaryScreen(
                            articles: articles,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: primarygreen,
                          decoration: TextDecoration.underline),
                      "Voir tout",
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const DiaryList()
            ],
          ),
        ),
      ),
    );
  }
}
