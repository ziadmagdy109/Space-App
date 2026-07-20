import 'package:flutter/material.dart';
import 'package:space_app/core/theme/app_colors.dart';

class TextAboutDetailsPlants extends StatelessWidget {
  const TextAboutDetailsPlants({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: 2,
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight(700),
      ),
    );
  }
}
