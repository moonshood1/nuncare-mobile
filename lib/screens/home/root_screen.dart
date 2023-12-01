import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/screens/home/annuary_screen.dart';
import 'package:nuncare/screens/home/home_screen.dart';
import 'package:nuncare/screens/home/message_screen.dart';
import 'package:nuncare/screens/home/profile_screen.dart';

class HomeRootScreen extends StatefulWidget {
  const HomeRootScreen({super.key});

  @override
  State<HomeRootScreen> createState() => _HomeRootScreenState();
}

class _HomeRootScreenState extends State<HomeRootScreen> {
  int _selectedIndex = 0;
  var activeScreen = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      activeScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = const HomeScreen();

    switch (activeScreen) {
      case 1:
        screenWidget = const AnnuaryScreen();
        break;
      case 2:
        screenWidget = const MessageScreen();
        break;
      case 3:
        screenWidget = const ProfileScreen();
        break;
      default:
        screenWidget = const HomeScreen();
    }

    return Scaffold(
      body: SafeArea(
        child: screenWidget,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: primarygreen,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(170, 0, 0, 0),
        iconSize: 32,
        selectedLabelStyle: GoogleFonts.poppins(letterSpacing: 1.2),
        unselectedLabelStyle: GoogleFonts.poppins(letterSpacing: 1.2),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil",
            backgroundColor: primarygreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Annuaire",
            backgroundColor: primarygreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messagerie",
            backgroundColor: primarygreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
            backgroundColor: primarygreen,
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
