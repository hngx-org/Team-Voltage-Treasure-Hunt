import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:voltage_treasure_hunt/components/constants/colors.dart';
import 'package:voltage_treasure_hunt/presentation/authentication_screens/sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void navigateToSignIn()async{
    await Future.delayed(const Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignIn()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: ScreenUtilInit(
          builder: (context, child) {
            return Column(
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
                          'Treasure Tails',
                          style: TextStyle(
                            color: AppColor.textColor,
                            fontFamily: 'Onest',
                            fontWeight: FontWeight.w800,
                            fontSize: 30.sp,
                          ),
                        ),
                        Icon(
                          Icons.web,
                          color: AppColor.textColor,
                          size: 33.r,
                        ),
                      ],
                    ),
                    // SpinKitSpinningLines(
                    //   color: AppColor.secondaryColor,
                    //   size: 30.r,
                    // ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 14).r,
                  child: Text(
                    'Version:- 1.0.0',
                    style: TextStyle(
                      color: AppColor.textColor,
                      fontFamily: 'Onest',
                      fontWeight: FontWeight.w800,
                      fontSize: 12.sp,
                    ),
                  ),
                )
              ],
            );
          },
          designSize: const Size(428, 926),
        ));
  }
}
