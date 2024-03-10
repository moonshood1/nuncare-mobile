import 'package:nuncare/models/article.dart';

class User {
  String id;
  String firstName;
  String lastName;
  String about;
  String type;
  String sex;
  String hospital;
  String speciality;
  int years;
  String img;
  String cover;
  String phone;
  String region;
  String city;
  String email;
  String password;
  String orderNumber;
  List<String> skills;
  List<String> experiences;
  bool isActive;
  List<Article> articles;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.about,
      required this.type,
      required this.sex,
      required this.hospital,
      required this.speciality,
      required this.years,
      required this.img,
      required this.cover,
      required this.phone,
      required this.region,
      required this.city,
      required this.email,
      required this.password,
      required this.orderNumber,
      required this.skills,
      required this.experiences,
      required this.isActive,
      required this.articles});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      about: json['about'] ?? '',
      type: json['type'] ?? '',
      sex: json['sex'] ?? '',
      hospital: json['hospital'] ?? '',
      speciality: json['speciality'],
      years: json['years'] ?? 0,
      img: json['img'] ?? '',
      cover: json['cover'] ?? '',
      phone: json['phone'],
      region: json['region'],
      city: json['city'],
      email: json['email'],
      password: json['password'],
      orderNumber: json['orderNumber'],
      isActive: json['isActive'],
      skills: List<String>.from(json['skills'] ?? []),
      experiences: List<String>.from(json['experiences'] ?? []),
      articles: (json['articles'] as List<dynamic>?)
              ?.map((articleJson) => Article.fromJson(articleJson))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'about': about,
      'type': type,
      'sex': sex,
      'hospital': hospital,
      'speciality': speciality,
      'years': years,
      'img': img,
      'cover': cover,
      'phone': phone,
      'region': region,
      'city': city,
      'email': email,
      'password': password,
      'orderNumber': orderNumber,
      'skills': skills,
      'experiences': experiences,
      'isActive': isActive,
      'articles': articles
    };
  }

  factory User.defaultUser() {
    return User(
      id: '',
      firstName: '',
      lastName: '',
      about: '',
      type: '',
      sex: '',
      hospital: '',
      speciality: '',
      years: 0,
      img: '',
      cover: '',
      phone: '',
      region: '',
      city: '',
      email: '',
      password: '',
      orderNumber: '',
      skills: [],
      experiences: [],
      articles: [],
      isActive: true,
    );
  }
}
