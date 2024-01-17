import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/models/article.dart';
import 'package:nuncare/screens/home/components/article_card.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key, required this.articles});

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        title: Text(
          "Le journal",
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (BuildContext ctx, int index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ArticleCard(
              article: articles[index],
            ),
          ),
        ),
      ),
    );
  }
}
