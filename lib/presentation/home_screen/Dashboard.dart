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
  const Dashboard({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

bool isTapped = false;

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff82591B),
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
                height: 30.h,
              ),
              SingleChildScrollView(
                child: Container(
                  decoration:  BoxDecoration(
                      color: Color(0xff001532),
                      borderRadius: BorderRadius.all(Radius.circular(22.r))),
                  height: 200.h,
                  width: 405.w,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32).r,
                        child:  CircleAvatar(
                          backgroundColor: Color(0xff001532),
                          backgroundImage: AssetImage('assets/images/avatar.jpg'),
                          radius: 60.r,
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          SizedBox(
                            width: 160.w,
                            child: Center(
                              child: Text(
                                widget.name.toUpperCase(),
                                style: TextStyle(
                                    color: Color(0xff5FCFA3),
                                    fontFamily: 'Onest',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.sp),
                              ),
                            ),
                          ),
                          
                          SizedBox(
                              width: 220.w,
                              child: Center(
                                child: Text(
                                  widget.email,
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
                                  width: 140.w,
                                  child:  Text('Points:',
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
                                  width: 150.w,
                                  child:  Text('Level:',
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
                            width: 155.w,
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
       SizedBox(
                height: 10.h,
              ),
              Container(
                height: 540.h,
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
                    SizedBox(
                      height: 80.h,
                    ),
                    !isTapped ? LeaderBoard() : Achievements()
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
                      border:
                          Border.all(color: Color(0xFF227654))),
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

