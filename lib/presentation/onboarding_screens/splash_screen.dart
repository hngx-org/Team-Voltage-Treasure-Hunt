// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:voltage_treasure_hunt/presentation/onboarding_screens/intro.dart';
// import 'package:audiopla';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToSignIn() async {
    await Future.delayed(const Duration(seconds: 7), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  IntroScreen()));
           await player.stop();
    });
  }

final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
      _loadAndPlayAudio();
  navigateToSignIn();

  
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void _loadAndPlayAudio() async {
    await player.setAsset('assets/audio/splashscreen.mp3');
    player.setVolume(0.25);
    await player.play();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff001532),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/IMG_4870.JPG',
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Treasure Tails ',
                            style: TextStyle(
                              color: Color(0xff5FCFA3),
                              fontFamily: 'MooLahLah',
                              fontWeight: FontWeight.w800,
                              fontSize: 35.sp,
                            ),
                          ),
                          Icon(
                            Icons.gps_fixed_outlined,
                            color: Color(0xff5FCFA3),
                            size: 33.r,
                          ),
                        ],
                      ),
                      SpinKitRipple(
                        color: Color(0xff5FCFA3),
                        size: 35.r,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14).r,
                    child: Text(
                      'Version:- 1.0.0',
                      style: TextStyle(
                        color: Color(0xff001532),
                        fontFamily: 'Onest',
                        fontWeight: FontWeight.w800,
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
            child: IgnorePointer(
              ignoring: true,
              child: Lottie.asset(
                'assets/animations/animation_lnlie7v9.json',
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            child: IgnorePointer(
              ignoring: true,
              child: Lottie.asset(
                'assets/animations/animation_lnlie7v9.json',
                // fit: BoxFit.cover
              ),
            ),
          ),
          ],
        ));
  }
}
