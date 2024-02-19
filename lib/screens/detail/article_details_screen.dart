import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/article.dart';
import 'package:intl/intl.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key, required this.article});

  final Article article;
  @override
  Widget build(BuildContext context) {
    DateTime inputDate = DateTime.parse(article.createdAt);

    String formattedDate = DateFormat('dd-MM-yyyy - HH:mm').format(inputDate);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarygreen,
        elevation: 2,
        title: Text(
          article.title,
          style: GoogleFonts.poppins(
            fontSize: 16,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                article.img,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  article.title,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Écrit par : ${article.authorName}',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'Date : $formattedDate',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                article.content,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
