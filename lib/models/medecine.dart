class Medecine {
  Medecine({
    required this.id,
    required this.img,
    required this.name,
    required this.category,
    required this.price,
  });

  String id, img, name, category, price;

  factory Medecine.fromJson(Map<String, dynamic> json) {
    return Medecine(
      id: json['_id'],
      img: json['img'],
      name: json['name'],
      category: json['category'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'img': img,
      'name': name,
      'category': category,
      'price': price,
    };
  }
}
