// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeaderBoard extends StatelessWidget {
  final String userName;
  const LeaderBoard({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440.h,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          leader(
            '1',
            userName.toUpperCase(),
            '5',
            medals(),
            medals(),
            medals(),
            medals(),
            medals(),
            Color.fromARGB(255, 44, 62, 94),
            Color.fromARGB(255, 75, 137, 112),
          ),
          Divider(
            indent: 20.w,
            endIndent: 20.w,
            color: Color(0xff5FCFA3),
          ),
          leader(
            '2',
            'PLAYER 2',
            '4',
            medals(),
            medals(),
            medals(),
            medals(),
            Text('    '),
            Color(0xff152339),
            Color(0xff285744),
          ),
          Divider(
            indent: 20.w,
            endIndent: 20.w,
            color: Color(0xff5FCFA3),
          ),
          leader(
            '3',
            'PLAYER 3',
            '3',
            medals(),
            medals(),
            medals(),
            Text('    '),
            Text('    '),
            Color(0xff152339),
            Color(0xff285744),
          ),
          Divider(
            indent: 20.w,
            endIndent: 20.w,
            color: Color(0xff5FCFA3),
          ),
          leader(
            '2',
            'PLAYER 4',
            '2',
            medals(),
            medals(),
            Text('    '),
            Text('    '),
            Text('    '),
            Color(0xff152339),
            Color(0xff285744),
          ),
          Divider(
            indent: 20.w,
            endIndent: 20.w,
            color: Color(0xff5FCFA3),
          ),
          leader(
            '5',
            'PLAYER 5',
            '1',
            medals(),
            Text('    '),
            Text('    '),
            Text('    '),
            Text('    '),
            Color(0xff152339),
            Color(0xff285744),
          ),
        ],
      ),
    );
  }

  Center leader(
    String firstNumber,
    String name,
    String secondNumber,
    Widget? medal1,
    Widget? medal2,
    Widget? medal3,
    Widget? medal4,
    Widget? medal5,
    Color color1,
    Color color2,
  ) {
    return Center(
      child: Row(
        children: [
          SizedBox(
            width: 15.w,
          ),
          Container(
              height: 55.h,
              width: 55.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    colors: [color1, color2],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
              child: Center(
                child: Text(firstNumber,
                    style: TextStyle(
                        color: Color(0xff5FCFA3),
                        fontFamily: 'Onest',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold)),
              )),
          SizedBox(
            width: 10.h,
          ),
          Container(
            height: 55.h,
            width: 55.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  colors: [color1, color2],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
            ),
            child: Center(
              child: Icon(
                FontAwesomeIcons.skullCrossbones,
                size: 22.r,
                color: Color(0xff5FCFA3),
              ),
            ),
          ),
          SizedBox(
            width: 10.h,
          ),
          Container(
              height: 55.h,
              width: 250.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    colors: [color1, color2],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(name,
                        style: TextStyle(
                            color: Color(0xff5FCFA3),
                            fontFamily: 'Onest',
                            fontSize: 16.sp)),
                    Row(
                      children: [
                        medal1!,
                        SizedBox(
                          width: 2.h,
                        ),
                        medal2!,
                        SizedBox(
                          width: 2.h,
                        ),
                        medal3!,
                        SizedBox(
                          width: 2.h,
                        ),
                        medal4!,
                        SizedBox(
                          width: 2.h,
                        ),
                        medal5!,
                      ],
                    ),
                    Text(secondNumber,
                        style: TextStyle(
                            color: Color(0xff5FCFA3),
                            fontFamily: 'Onest',
                            fontSize: 18.sp)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

Icon medals() {
  return Icon(
    FontAwesomeIcons.medal,
    size: 14.r,
    color: Colors.yellow,
  );
}
