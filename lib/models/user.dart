class User {
  const User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.orderNumber,
      required this.city,
      required this.speciality,
      required this.medicalCenter,
      required this.email,
      required this.token});

  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String orderNumber;
  final String city;
  final String speciality;
  final String medicalCenter;
  final String email;
  final String token;
}
