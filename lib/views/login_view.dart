import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:space_app/core/gen/assets.gen.dart';
import 'package:space_app/core/theme/app_colors.dart';
import 'package:space_app/views/home_view.dart';
import 'package:space_app/widgets/buttom_explore.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Assets.images.frame1.image(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
              child: Column(
                children: [
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Explore\nThe\nUniverse",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 48,
                        color: AppColors.white,
                        fontWeight: FontWeight(900),
                      ),
                    ),
                  ),
                  Spacer(),
                  Bounceable(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => HomeView()),
                    ),
                    child: ButtomExplore(text: "Explore"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
