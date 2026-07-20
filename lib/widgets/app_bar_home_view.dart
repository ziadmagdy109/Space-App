import 'package:flutter/material.dart';

class AppBarHomeView extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leadingWidth: 70,
      title: const Text(
        "Explore",
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
