class Pharmacy {
  const Pharmacy({
    required this.picture,
    required this.name,
    required this.location,
    required this.stars,
    required this.position,
    required this.cover,
    required this.isGuard,
    required this.description,
  });
  final String picture;
  final String name;
  final String location;
  final double stars;
  final double position;
  final bool isGuard;
  final String cover;
  final String description;
}
