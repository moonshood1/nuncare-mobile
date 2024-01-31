import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/article.dart';
import 'package:nuncare/screens/detail/article_details_screen.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget(
      {super.key, required this.openArticleOverlay, required this.articles});

  final void Function() openArticleOverlay;
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    Widget widgetContent = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final article in articles)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ProfileArticleCard(
                article: article,
              ),
            )
        ],
      ),
    );

    //  GridView.builder(
    //   scrollDirection: Axis.horizontal,
    //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //     maxCrossAxisExtent: 200,
    //     crossAxisSpacing: 10,
    //     mainAxisSpacing: 10,
    //   ),
    //   itemCount: articles.length,
    //   itemBuilder: (context, index) {
    //     return ProfileArticleCard(article: articles[index]);
    //   },
    // );

    if (articles.isEmpty) {
      widgetContent = Align(
        alignment: Alignment.center,
        child: Text(
          "Aucun article publié",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mes articles",
                style: GoogleFonts.poppins(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton.icon(
                icon: const Icon(
                  Icons.edit,
                  color: primarygreen,
                ),
                onPressed: openArticleOverlay,
                label: Text(
                  "Créer un article",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: primarygreen,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          widgetContent
        ],
      ),
    );
  }
}

class ProfileArticleCard extends StatelessWidget {
  const ProfileArticleCard({super.key, required this.article});

  // final String title, date, reaction, image;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailsScreen(article: article),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: const Offset(0, 2),
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Image.network(
                article.img,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              article.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 20,
              children: [
                Text(
                  article.createdAt,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
