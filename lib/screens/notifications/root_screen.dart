import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarygreen,
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: const Center(
        child: Text('Aucune notification pour l\'instant'),
      ),
    );
  }
}
