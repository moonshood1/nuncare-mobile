class Ad {
  Ad({
    required this.id,
    required this.label,
    required this.img,
    required this.company,
    required this.description,
    required this.webisteLink,
    required this.isActive,
  });

  String id, label, img, company, description, webisteLink;
  bool isActive;

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
        id: json['_id'],
        img: json['img'],
        label: json['label'],
        company: json['company'],
        description: json['description'],
        webisteLink: json['webisteLink'],
        isActive: json['isActive']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'img': img,
      'company': company,
      'webisteLink': webisteLink,
      'description': description,
      "isActive": isActive
    };
  }
}
