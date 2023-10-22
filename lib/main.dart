import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:voltage_treasure_hunt/components/themes/app_themes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:voltage_treasure_hunt/presentation/app_settings/settings_screen.dart';
import 'package:voltage_treasure_hunt/presentation/authentication_screens/sign_in.dart';
import 'package:voltage_treasure_hunt/presentation/onboarding_screens/intro.dart';
import 'package:voltage_treasure_hunt/presentation/onboarding_screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
]);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: false,
      builder: (BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<MusicToggle>.value(value: MusicToggle()),
        ],
        child: const MyApp(),
      ),
    ),
  );
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
          home: SplashScreen(),
        );
      },
    );
  }
}















