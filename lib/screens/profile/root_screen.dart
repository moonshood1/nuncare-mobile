import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/screens/profile/article_writing_screen.dart';
import 'package:nuncare/screens/profile/edit_profile_screen.dart';
import 'package:nuncare/screens/profile/profile_details_screen.dart';

class ProfileRootScreen extends StatefulWidget {
  const ProfileRootScreen({super.key});

  @override
  State<ProfileRootScreen> createState() => _ProfileRootScreenState();
}

class _ProfileRootScreenState extends State<ProfileRootScreen> {
  var activeScreen = "profile-screen";

  void goToEdit() {
    setState(() {
      activeScreen = "profile-edit-screen";
    });
  }

  void goToProfile() {
    setState(() {
      activeScreen = "profile-screen";
    });
  }

  void goToArticleWriting() {
    setState(() {
      activeScreen = "article-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    switch (activeScreen) {
      case "profile-edit-screen":
        screenWidget = const ProfileEditScreen();
        break;
      case "article-screen":
        screenWidget = const ArticleWritingScreen();
        break;
      default:
        screenWidget = const ProfileDetailsScreen();
    }

    return screenWidget;
  }
}
