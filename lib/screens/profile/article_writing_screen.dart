import 'package:flutter/material.dart';

class ArticleWritingScreen extends StatefulWidget {
  const ArticleWritingScreen({super.key});

  @override
  State<ArticleWritingScreen> createState() => _ArticleWritingScreenState();
}

class _ArticleWritingScreenState extends State<ArticleWritingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const <Widget>[
          Text("TO DO : Ecran de redaction de l'article")
        ],
      ),
    );
  }
}
