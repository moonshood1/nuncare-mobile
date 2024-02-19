import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/models/article.dart';
import 'package:nuncare/screens/home/components/article_card.dart';

class DiaryList extends StatelessWidget {
  const DiaryList({super.key, required this.articles});

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    Widget content = Align(
      alignment: Alignment.center,
      child: Text(
        "Aucun article disponible",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.w200,
        ),
      ),
    );

    if (articles.isNotEmpty) {
      content = Wrap(
        spacing: 10,
        runSpacing: 10,
        children: <Widget>[
          ...articles.map((article) => ArticleCard(article: article)).toList(),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    }

    return content;
  }
}
