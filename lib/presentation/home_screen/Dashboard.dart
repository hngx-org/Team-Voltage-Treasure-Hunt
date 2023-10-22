// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:voltage_treasure_hunt/presentation/home_screen/widgets/achievements.dart';
import 'package:voltage_treasure_hunt/presentation/home_screen/widgets/gameModeDialog.dart';
import 'package:voltage_treasure_hunt/presentation/home_screen/widgets/leaderboard.dart';
import 'package:voltage_treasure_hunt/presentation/home_screen/widgets/screenToggles.dart';

class Dashboard extends StatefulWidget {
  final String name;
  final String email;
  final String firstName;
  const Dashboard({Key? key, required this.name, required this.email, required this.firstName})
      : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

bool isTapped = false;

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff001532),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/IMG_4871.JPG',
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40.h,
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff001532),
                      borderRadius: BorderRadius.all(Radius.circular(22.r))),
                  height: 200.h,
                  width: 405.w,
                  
                  child: SingleChildScrollView(
                    child: Row(
                      
                      children: [
                        
                        CircleAvatar(
                          backgroundColor:  Color(0xff001532),
                          radius: 90.r,
                          child: SizedBox(
                            height: 170.h,
                            width: double.infinity,
                            child: Lottie.asset(
                              'assets/animations/animation_lny12g3w.json',
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 40.h,
                            ),
                            SizedBox(
                              width: 160.w,
                              child: Center(
                                child: Text(
                                  widget.name.isEmpty ? 'PLAYER' : widget.name.toUpperCase(),
                                  style: TextStyle(
                                      color: Color(0xff5FCFA3),
                                      fontFamily: 'Onest',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp),
                                ),
                              ),
                            ),
                            SizedBox(
                                width: 220.w,
                                child: Center(
                                  child: Text(
                                    widget.email.isEmpty
                                        ? 'player2023@gmail.com'
                                        : widget.email,
                                    style: TextStyle(
                                        color: Color(0xff5FCFA3),
                                        fontFamily: 'Onest',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                  ),
                                )),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width: 170.w,
                                    child: Text('Points:',
                                        style: TextStyle(
                                            color: Color(0xff5FCFA3),
                                            fontFamily: 'Onest',
                                            fontSize: 14.sp))),
                                Text('30',
                                    style: TextStyle(
                                        color: Color(0xff5FCFA3),
                                        fontFamily: 'Onest',
                                        fontSize: 14.sp))
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width: 182.w,
                                    child: Text('Level:',
                                        style: TextStyle(
                                            color: Color(0xff5FCFA3),
                                            fontFamily: 'Onest',
                                            fontSize: 14.sp))),
                                Text('1',
                                    style: TextStyle(
                                        color: Color(0xff5FCFA3),
                                        fontFamily: 'Onest',
                                        fontSize: 14.sp))
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Container(
                              height: 5.h,
                              width: 190.w,
                              color: Color(0xff5FCFA3),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 530.h,
                width: 405.w,
                decoration: BoxDecoration(
                    color: Color(0xff001532),
                    borderRadius: BorderRadius.circular(22)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0).r,
                      child: ScreenToggle(
                        textColor1:
                            isTapped ? Color(0xff5FCFA3) : Color(0xff001532),
                        textColor2:
                            isTapped ? Color(0xff001532) : Color(0xff5FCFA3),
                        color1:
                            isTapped ? Colors.transparent : Color(0xff5FCFA3),
                        color2:
                            isTapped ? Color(0xff5FCFA3) : Colors.transparent,
                        elevation: 8,
                        onTap: () {
                          setState(() {
                            isTapped = !isTapped;
                          });
                        },
                      ),
                    ),
                    !isTapped
                        ? LeaderBoard(
                            userName:
                                widget.name.isEmpty ? 'PLAYER 1' : widget.firstName,
                          )
                        : Achievements()
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return GameModeDialog();
                    },
                  );
                },
                child: Container(
                  height: 60.h,
                  width: 405.w,
                  decoration: BoxDecoration(
                      color: Color(0xff001532),
                      borderRadius: BorderRadius.circular(22.r),
                      border: Border.all(color: Color(0xFF227654))),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('''Let's Hunt''',
                          style: TextStyle(
                              color: Color(0xFF73E2B5),
                              fontFamily: 'Onest',
                              fontWeight: FontWeight.w900,
                              fontSize: 25.sp)),
                      // SizedBox(width: 10,),
                      SizedBox(
                        height: 70.h,
                        width: 50.w,
                        child: Lottie.asset(
                          'assets/animations/animation_lnllqogw.json',
                        ),
                      ),
                    ],
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
