import 'package:flutter/material.dart';
import 'package:space_app/core/theme/app_colors.dart';
import 'package:space_app/views/login_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.black,
        fontFamily: "Space Grotesk",
      ),
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
