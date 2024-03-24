import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/ad.dart';
import 'package:nuncare/models/article.dart';
import 'package:nuncare/models/medecine.dart';
import 'package:nuncare/models/notification.dart';
import 'package:nuncare/screens/diary/diary_screen.dart';
import 'package:nuncare/screens/home/components/ad_card.dart';
import 'package:nuncare/screens/home/components/diary_list.dart';
import 'package:nuncare/screens/home/components/medoc_list.dart';
import 'package:nuncare/screens/notifications/root_screen.dart';
import 'package:nuncare/screens/medecines/medecines_screen.dart';
import 'package:nuncare/services/resource_service.dart';
import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';

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
  List<Notif> notifications = [];

  @override
  void initState() {
    getMedecines();
    getAds();
    getArticles();
    getNotifications();
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

  void getNotifications() async {
    try {
      List<Notif> response = await resourceService.getNotifications();

      setState(() {
        notifications = response;
      });
    } catch (e) {
      print(e);
    }
  }

  void getNews() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Image.asset(
          "assets/images/logo_nuncare.png",
          width: 30,
        ),

        // const Text(
        //   "Accueil",
        // ),
        backgroundColor: primarygreen,
        actions: [
          badges.Badge(
            badgeContent: const Text(
              "0",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            position: badges.BadgePosition.topStart(top: 2, start: 5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.article,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          badges.Badge(
            badgeContent: Text(
              notifications.length.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
            position: badges.BadgePosition.topStart(top: 2, start: 5),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => NotificationsScreen(
                      notifications: notifications,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.notifications,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
        ],
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
              CarouselSlider(
                options: CarouselOptions(
                  height: 130.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                ),
                items: ads.map(
                  (i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return AdCard(ad: i);
                      },
                    );
                  },
                ).toList(),
              ),
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
                        builder: (context) => const MedecinesScreen(),
                      ),
                    ),
                    child: Text(
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: primarygreen,
                      ),
                      "Voir tout",
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              MedocList(medecines: medecines),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DiaryScreen(),
                        ),
                      );
                    },
                    child: Text(
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: primarygreen,
                      ),
                      "Voir tout",
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              DiaryList(
                articles: articles,
              )
            ],
          ),
        ),
      ),
    );
  }
}
