import 'package:flutter/material.dart';
import 'package:space_app/core/theme/app_colors.dart';

class IconButtom extends StatelessWidget {
  const IconButtom({super.key, required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        child: Icon(icon, color: AppColors.white),
      ),
    );
  }
}
