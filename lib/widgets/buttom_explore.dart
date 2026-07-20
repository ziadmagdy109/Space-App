import 'package:flutter/material.dart';
import 'package:space_app/core/theme/app_colors.dart';

class ButtomExplore extends StatelessWidget {
  const ButtomExplore({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(29),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.white,
              fontWeight: FontWeight(600),
            ),
          ),
          Icon(Icons.arrow_forward_rounded, color: AppColors.white),
        ],
      ),
    );
  }
}
