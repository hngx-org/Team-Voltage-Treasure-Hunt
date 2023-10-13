import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voltage_treasure_hunt/components/widgets/customButton.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:voltage_treasure_hunt/presentation/authentication_screens/sign_up.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 116, 168, 190),
      body: GlassmorphicContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        borderRadius: 30,
        border: 0,
        blur: 4,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.2),
            Colors.white.withOpacity(0.2),
          ],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0),
            Colors.white.withOpacity(0),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 70.h,
            ),
            Container(
              height: 600.h,
              width: 390.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/IMG_4866.JPG',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Row(
                    children: [
                      Text(
                        ''' Welcome to Treasure Tails''',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF0C3772),
                            fontFamily: 'Onest',
                            fontWeight: FontWeight.w700,
                            fontSize: 28.sp),
                      ),
                      Text(
                        '☠️',
                        style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'Onest',
                            fontWeight: FontWeight.w700,
                            fontSize: 28.sp),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 17,
                    right: 17,
                    top: 15,
                  ).r,
                  child: Text(
                    textAlign: TextAlign.center,
                    '''Customize your avatar, explore maps, and interact with augmented reality objects. Join the hunt, compete on leaderboards, and immerse yourself in an unforgettable adventure. Are you ready to find the hidden treasures in your world?''',
                    style: TextStyle(
                        color: Color(0xFF0C3772),
                        fontFamily: 'Onest',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16),
              child: CustomButton(
                buttonText: 'Get Started',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                      //  MaterialPageRoute(builder: (context) => const HomePage()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
