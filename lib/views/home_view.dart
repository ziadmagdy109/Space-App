import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:space_app/core/gen/assets.gen.dart';
import 'package:space_app/core/theme/app_colors.dart';
import 'package:space_app/model/planet_model.dart';
import 'package:space_app/views/planet_details_view.dart';
import 'package:space_app/widgets/app_bar_home_view.dart';
import 'package:space_app/widgets/buttom_explore.dart';
import 'package:space_app/widgets/icon_buttom.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    loadPlanets();
    super.initState();
  }

  PageController controller = PageController();
  List<PlanetModel> planets = [];
  int currentIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (planets.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarHomeView(),
      body: Stack(
        children: [
          Assets.images.rectangle4.image(
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withValues(alpha: 0.90),
                Colors.black.withValues(alpha: 1),
                Colors.black.withValues(alpha: 2),
              ],
              stops: [
                0.0,
                0.35,
                0.65,
                1.0,
              ],
            ),
          ),
        ),
      ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 165),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Which planet\nwould you like to explore?",
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.white,
                      fontWeight: FontWeight(700),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    controller: controller,
                    itemCount: planets.length,
                    itemBuilder: (context, index) {
                      return Image.asset(planets[index].image);
                    },
                  ),
                ),
                SizedBox(height: 38),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButtom(
                        icon: Icons.arrow_back,
                        onTap: () {
                          controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                      Text(
                        planets[currentIndex].name,
                        style: TextStyle(
                          fontSize: 24,
                          color: AppColors.white,
                          fontWeight: FontWeight(700),
                        ),
                      ),
                      IconButtom(
                        icon: Icons.arrow_forward,
                        onTap: () {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Bounceable(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PlanetDetailsView(
                            planetModel: planets[currentIndex],
                          ),
                        ),
                      );
                    },
                    child: ButtomExplore(
                      text: "Explore ${planets[currentIndex].name}",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadPlanets() async {
    String content = await rootBundle.loadString("assets/data/planets.json");

    final List decoded = jsonDecode(content);

    planets = decoded.map((e) => PlanetModel.fromJson(e)).toList();

    setState(() {});
  }
}
