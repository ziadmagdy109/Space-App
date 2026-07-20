// import 'dart:convert';

// import 'package:flutter/services.dart';
// import 'package:space_app/model/planet_model.dart';

// Future<List<dynamic>> loadPlanets() async {
//   final String jsonString = await rootBundle.loadString(
//     "assets/data/planets.json",
//   );
//   final decoded = jsonDecode(jsonString);
//   final planets = decoded.map((planetJson) {
//     return PlanetModel.fromJson(planetJson);
//   }).toList();
//   return planets;
// }
