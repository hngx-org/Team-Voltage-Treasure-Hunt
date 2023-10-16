import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voltage_treasure_hunt/components/themes/app_themes.dart';
import 'package:device_preview/device_preview.dart';
// import 'package:voltage_treasure_hunt/animation_samples.dart';
import 'package:voltage_treasure_hunt/presentation/onboarding_screens/splash_screen.dart';

void main() {
  runApp(DevicePreview(
    enabled: false,
    builder: (BuildContext context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: appTheme,
          home: const SplashScreen(),
        );
      },
    );
  }
}
