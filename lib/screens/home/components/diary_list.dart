import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/data/articles.dart';
import 'package:nuncare/screens/home/components/article_card.dart';

class DiaryList extends StatelessWidget {
  const DiaryList({super.key});

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
