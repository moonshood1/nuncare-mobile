import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuncare/common/colors.dart';
import 'package:nuncare/models/article.dart';
import 'package:nuncare/screens/detail/article_details_screen.dart';
import 'package:intl/intl.dart';

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
        alignment: Alignment.centerLeft,
        child: Text(
          "Aucun article publié",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w200,
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mes articles",
            style: GoogleFonts.poppins(
              color: Colors.black.withOpacity(0.7),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          TextButton.icon(
            icon: const Icon(
              Icons.add,
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
          const SizedBox(
            height: 5,
          ),
          widgetContent
        ],
      ),
    );
  }
}

class ProfileArticleCard extends StatelessWidget {
  const ProfileArticleCard({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    DateTime inputDate = DateTime.parse(article.createdAt);

    String formattedDate = DateFormat('dd-MM-yyyy - HH:mm').format(inputDate);

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                article.theme,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                formattedDate,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          )),
    );
  }
}
