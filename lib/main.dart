import 'package:flutter/material.dart';
import 'package:voltage_treasure_hunt/components/themes/app_themes.dart';
import 'package:voltage_treasure_hunt/presentation/onboarding_screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: const SplashScreen(),
    );
  }
}

