class Position {
  String lng;
  String lat;

  Position({required this.lng, required this.lat});

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      lng: json['lng'],
      lat: json['lat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lng': lng,
      'lat': lat,
    };
  }
}

class Instance {
  Instance({
    required this.id,
    required this.name,
    required this.city,
    required this.district,
    required this.position,
    required this.phone,
    required this.img,
  });

  String id;
  String name;
  String city;
  String district;
  String phone;
  String img;
  Position position;

  factory Instance.fromJson(Map<String, dynamic> json) {
    return Instance(
      id: json['_id'],
      img: json['img'],
      name: json['name'],
      city: json['city'],
      district: json['district'],
      position: Position.fromJson(json['position']),
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'img': img,
      'name': name,
      'city': city,
      'district': district,
      'position': position.toJson(),
      'phone': phone,
    };
  }
}
