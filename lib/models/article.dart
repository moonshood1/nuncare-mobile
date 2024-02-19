class Article {
  Article({
    required this.id,
    required this.img,
    required this.title,
    required this.description,
    required this.author,
    required this.createdAt,
    required this.content,
    required this.authorName,
    required this.theme,
  });

  String id,
      img,
      title,
      author,
      description,
      createdAt,
      content,
      authorName,
      theme;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json["_id"],
      img: json['img'],
      title: json['title'],
      author: json['author'],
      authorName: json['authorName'],
      description: json['description'],
      createdAt: json['createdAt'],
      content: json['content'],
      theme: json['theme'],
    );
  }
}
