import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:space_app/core/gen/assets.gen.dart';
import 'package:space_app/core/theme/app_colors.dart';
import 'package:space_app/model/planet_model.dart';
import 'package:space_app/widgets/app_bar_planet_view.dart';
import 'package:space_app/widgets/text_about_details_plants.dart';

class PlanetDetailsView extends StatefulWidget {
  const PlanetDetailsView({super.key, required this.planetModel});

  final PlanetModel planetModel;

  @override
  State<PlanetDetailsView> createState() => _PlanetDetailsViewState();
}

class _PlanetDetailsViewState extends State<PlanetDetailsView> {
  Flutter3DController controller = Flutter3DController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(name: widget.planetModel.name),
      body: Stack(
        children: [
          Assets.images.rectangle4.image(),
          Padding(
            padding: const EdgeInsets.only(top: 22, right: 16, left: 16),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 122),
                  Text(
                    widget.planetModel.title,
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.white,
                      fontWeight: FontWeight(700),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 300,
                    child: Flutter3DViewer(
                      controller: controller,
                      src: widget.planetModel.model,
                      activeGestureInterceptor: true,
                      enableTouch: true,
                    ),
                  ),
                  // Image.asset(planetModel.image),
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.white,
                      fontWeight: FontWeight(700),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.planetModel.about,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.white,
                      fontWeight: FontWeight(300),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextAboutDetailsPlants(
                    text:
                        "Distance from Sun (km) : ${widget.planetModel.distanceFromSun}",
                  ),
                  TextAboutDetailsPlants(
                    text:
                        "Length of Day (hours) : ${widget.planetModel.lengthOfDay}",
                  ),
                  TextAboutDetailsPlants(
                    text:
                        "Orbital Period (Earth years) : ${widget.planetModel.orbitalPeriod}",
                  ),
                  TextAboutDetailsPlants(
                    text: "Radius (km) : ${widget.planetModel.radius}",
                  ),
                  TextAboutDetailsPlants(
                    text: "Mass (kg) : ${widget.planetModel.mass}",
                  ),
                  TextAboutDetailsPlants(
                    text: "Gravity (m/s²) : ${widget.planetModel.gravity}",
                  ),
                  TextAboutDetailsPlants(
                    text:
                        "Surface Area (km²) : ${widget.planetModel.surfaceArea}",
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
