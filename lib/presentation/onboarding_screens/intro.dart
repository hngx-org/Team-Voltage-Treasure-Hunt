// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voltage_treasure_hunt/components/widgets/customButton.dart';
import 'package:voltage_treasure_hunt/presentation/authentication_screens/sign_up.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF93BED1),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Container(
              height: 625.h,
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
                  padding: const EdgeInsets.only(left: 40.0).r,
                  child: Row(
                    children: [
                      Text(
                        ''' Welcome to Treasure Tails''',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF0C3772),
                            fontFamily: 'Onest',
                            fontWeight: FontWeight.w700,
                            fontSize: 26.sp),
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
                    top: 0,
                    bottom: 10
                  ).r,
                  child: Text(
                    textAlign: TextAlign.center,
                    '''Customize your avatar, explore maps, and interact with augmented reality objects. Join the hunt, compete on leaderboards, and immerse yourself in an unforgettable adventure. Are you ready to find the hidden treasures in your world?''',
                    style: TextStyle(
                        color: Color(0xFF0C3772),
                        fontFamily: 'Onest',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 31.0).r,
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
