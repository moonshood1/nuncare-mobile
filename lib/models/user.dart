class User {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.about,
    required this.phone,
    required this.orderNumber,
    required this.city,
    required this.speciality,
    required this.hospital,
    required this.email,
    this.skills,
    this.experiences,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String orderNumber;
  final String city;
  final String speciality;
  final String hospital;
  final String email;
  final String? about;
  final List<dynamic>? skills;
  final List<dynamic>? experiences;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      about: json['about'],
      phone: json['phone'],
      orderNumber: json['orderNumber'],
      city: json['city'],
      speciality: json['speciality'],
      hospital: json['hospital'],
      email: json['email'],
      skills: json['skills'],
      experiences: json['experiences'],
    );
  }

  factory User.defaultUser() {
    return const User(
      id: '',
      firstName: '',
      lastName: '',
      phone: '',
      orderNumber: '',
      city: '',
      speciality: '',
      hospital: '',
      email: '',
      about: '',
      skills: [],
      experiences: [],
    );
  }
}
