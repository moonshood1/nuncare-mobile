import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/article.dart';
import 'package:nuncare/models/user.dart';
import 'package:nuncare/screens/profile/components/profile_drawer.dart';
import 'package:nuncare/screens/profile/image_editing_screen.dart';
import 'package:nuncare/screens/profile/modals/about_edit_modal.dart';
import 'package:nuncare/screens/profile/modals/about_modal.dart';
import 'package:nuncare/screens/profile/modals/article_modal.dart';
import 'package:nuncare/screens/profile/components/about_widget.dart';
import 'package:nuncare/screens/profile/components/article_widget.dart';
import 'package:nuncare/screens/profile/components/experience_widget.dart';
import 'package:nuncare/screens/profile/components/skill_widget.dart';
import 'package:nuncare/screens/profile/components/stats_widget.dart';
import 'package:nuncare/screens/profile/modals/experience_edit_modal.dart';
import 'package:nuncare/screens/profile/modals/experience_modal.dart';
import 'package:nuncare/screens/profile/modals/skill_modal.dart';
import 'package:nuncare/screens/profile/password_editing_screen.dart';
import 'package:nuncare/screens/profile/profile_editing_screen.dart';
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
      userArticles = response.user.articles;
    });
  }

  void _openAddModal(BuildContext context, Widget screen) async {
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

  void _openProfileEditingPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => ProfileEditingScreen(user: user),
      ),
    );

    if (result != null && result == true) {
      _loadData();
    }
  }

  void _openPasswordEditingPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => const PasswordEditscreen(),
      ),
    );

    if (result != null && result == true) {
      _loadData();
    }
  }

  void _openImageEditingPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => const ImageEditScreen(),
      ),
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
      ),
      drawer: ProfileDrawer(
        profileEdit: _openProfileEditingPage,
        passwordEdit: _openPasswordEditingPage,
        imageEdit: _openImageEditingPage,
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
                      backgroundImage: NetworkImage(user.img),
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
                    openAboutOverlay: () => _openAddModal(
                      context,
                      const AboutModal(),
                    ),
                    openEditOverlay: () => _openEditingModal(
                      context,
                      AboutEditModal(aboutText: user.about),
                    ),
                    aboutText: user.about,
                  ),
                  XpWidget(
                    openXpOverlay: () => _openAddModal(
                      context,
                      const ExperienceModal(),
                    ),
                    openEditOverlay: () => _openEditingModal(
                      context,
                      ExperienceEditModal(
                        experience: user.experiences[1],
                        position: user.experiences.indexOf(
                          user.experiences[1],
                        ),
                      ),
                    ),
                    experiences: user.experiences,
                  ),
                  SkillWidget(
                    openSkillOverlay: () => _openAddModal(
                      context,
                      const SkillModal(),
                    ),
                    skills: user.skills,
                  ),
                  ArticleWidget(
                    openArticleOverlay: () => _openAddModal(
                      context,
                      const ArticleModal(),
                    ),
                    articles: userArticles,
                  ),
                  const StatsWidget(),
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
