class PlanetModel {
  final String name;
  final String image;
  final String model;
  final String title;
  final String about;
  final double distanceFromSun;
  final double lengthOfDay;
  final double orbitalPeriod;
  final double radius;
  final String mass;
  final double gravity;
  final String surfaceArea;

  PlanetModel({
    required this.name,
    required this.image,
    required this.model,
    required this.title,
    required this.about,
    required this.distanceFromSun,
    required this.lengthOfDay,
    required this.orbitalPeriod,
    required this.radius,
    required this.mass,
    required this.gravity,
    required this.surfaceArea,
  });

  factory PlanetModel.fromJson(Map<String, dynamic> json) {
    return PlanetModel(
      name: json["name"],
      image: json["image"],
      model: json["model"],
      title: json["title"],
      about: json["about"],
      distanceFromSun: (json["distanceFromSun"] as num).toDouble(),
      lengthOfDay: (json["lengthOfDay"] as num).toDouble(),
      orbitalPeriod: (json["orbitalPeriod"] as num).toDouble(),
      radius: (json["radius"] as num).toDouble(),
      mass: json["mass"],
      gravity: (json["gravity"] as num).toDouble(),
      surfaceArea: json["surfaceArea"],
    );
  }
}
