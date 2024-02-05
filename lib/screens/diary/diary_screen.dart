import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/screens/home/components/article_card.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key, required this.articles});

  final List<dynamic> articles;

  @override
  Widget build(BuildContext context) {
    Widget content = Align(
      alignment: Alignment.center,
      child: Text(
        "Aucun article disponible",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
      ),
    );

    if (articles.isNotEmpty) {
      content = ListView.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext ctx, int index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ArticleCard(
            article: articles[index],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarygreen,
        centerTitle: false,
        elevation: 4,
        title: Text(
          "Le journal",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: content,
      ),
    );
  }
}
