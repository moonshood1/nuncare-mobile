import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/article.dart';
import 'package:nuncare/models/user.dart';
import 'package:nuncare/screens/profile/modals/about_modal.dart';
import 'package:nuncare/screens/profile/modals/article_modal.dart';
import 'package:nuncare/screens/profile/components/about_widget.dart';
import 'package:nuncare/screens/profile/components/article_widget.dart';
import 'package:nuncare/screens/profile/components/experience_widget.dart';
import 'package:nuncare/screens/profile/components/skill_widget.dart';
import 'package:nuncare/screens/profile/components/stats_widget.dart';
import 'package:nuncare/screens/profile/modals/experience_modal.dart';
import 'package:nuncare/screens/profile/modals/profile_editing_modal.dart';
import 'package:nuncare/screens/profile/modals/skill_modal.dart';
import 'package:nuncare/services/account_service.dart';
import 'package:nuncare/services/user_service.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  User user = User.defaultUser();
  List<Article> userArticles = [];

  var userService = UserService();
  var accountService = AccountService();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() async {
    var response = await userService.getUserData();

    setState(() {
      user = response.user;
      userArticles = response.articles;
    });
  }

  void _openEditingModal(BuildContext context, Widget screen) async {
    final result = await showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => screen,
    );

    if (result != null && result == true) {
      _loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    double coverHeight = 200;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Profil",
        ),
        backgroundColor: primarygreen,
        actions: [
          IconButton(
            onPressed: () => _openEditingModal(
              context,
              ProfileModal(
                user: user,
              ),
            ),
            icon: const Icon(
              Icons.edit,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                        backgroundImage:
                            AssetImage("assets/images/profil_3.png"),
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
                      "${user.firstName} ${user.lastName}",
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
                      user.speciality,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  AboutWidget(
                    openAboutOverlay: () => _openEditingModal(
                      context,
                      const AboutModal(),
                    ),
                    aboutText: user.about,
                  ),
                  XpWidget(
                    openXpOverlay: () => _openEditingModal(
                      context,
                      const ExperienceModal(),
                    ),
                    experiences: user.experiences,
                  ),
                  SkillWidget(
                    openSkillOverlay: () => _openEditingModal(
                      context,
                      const SkillModal(),
                    ),
                    skills: user.skills,
                  ),
                  ArticleWidget(
                    openArticleOverlay: () => _openEditingModal(
                      context,
                      const ArticleModal(),
                    ),
                    articles: userArticles,
                  ),
                  const StatsWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton.icon(
                    label: Text(
                      "Déconnexion",
                      style: GoogleFonts.poppins(
                        color: Colors.red.shade300,
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.logout,
                      size: 20,
                      color: Colors.red.shade300,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
