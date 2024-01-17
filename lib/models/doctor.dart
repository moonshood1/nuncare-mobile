class Doctor {
  const Doctor(
      {required this.picture,
      required this.name,
      required this.role,
      required this.stars,
      required this.years,
      required this.position,
      required this.about,
      required this.isActive});

  final String picture;
  final String name;
  final String role;
  final double stars;
  final double position;
  final double years;
  final String about;
  final bool isActive;
}
