import 'package:flutter/material.dart';
import 'package:gabon_meuble_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:gabon_meuble_app/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: GMAppTheme.lightTheme,
      darkTheme: GMAppTheme.darkTheme,
      home: const OnBoardingScreen(), 
    );
  }
}
