class Article {
  const Article(
      {required this.image,
      required this.title,
      required this.author,
      required this.readingTime,
      required this.createdAt,
      required this.reactions,
      required this.content});

  final String image;
  final String title;
  final String author;
  final String readingTime;
  final String createdAt;
  final String reactions;
  final String content;
}
