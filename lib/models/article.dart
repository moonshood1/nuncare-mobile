class Article {
  Article({
    required this.id,
    required this.img,
    required this.title,
    required this.description,
    required this.author,
    required this.createdAt,
    required this.content,
  });

  String id, img, title, author, description, createdAt, content;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json["_id"],
      img: json['img'],
      title: json['title'],
      author: json['author'],
      description: json['description'],
      createdAt: json['createdAt'],
      content: json['content'],
    );
  }
}
