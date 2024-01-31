class Article {
  const Article({
    required this.img,
    required this.title,
    required this.description,
    required this.author,
    required this.createdAt,
    required this.content,
  });

  final String img;
  final String title;
  final String author;
  final String description;
  final String createdAt;
  final String content;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      img: json['img'],
      title: json['title'],
      author: json['author'],
      description: json['description'],
      createdAt: json['createdAt'],
      content: json['content'],
    );
  }
}
