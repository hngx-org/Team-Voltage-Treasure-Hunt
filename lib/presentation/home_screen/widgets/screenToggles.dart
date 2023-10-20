// ignore_for_file: must_be_immutable, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenToggle extends StatelessWidget {
  ScreenToggle(
      {required this.color1,
      required this.color2,
      required this.elevation,
      required this.onTap,
      required this.textColor1,
      required this.textColor2});

  Color color1;
  Color color2;
  double elevation;
  Function()? onTap;
  Color textColor1;
  Color textColor2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 300.w,
      decoration: BoxDecoration(
        color: Color(0xff001532),
        borderRadius: BorderRadius.circular(23.r),
        border: Border.all(color: Color(0xff5FCFA3),)
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Material(
              elevation: elevation,
              borderRadius: BorderRadius.circular(22),
              color: Colors.transparent,
              child: Container(
                height: 50.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.circular(22.r),
                ),
                child: Center(
                  child: Text(
                    'Leaderboard',
                    style: TextStyle(
                      color: textColor1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Material(
              elevation: elevation,
              borderRadius: BorderRadius.circular(22.r),
              color: Colors.transparent,
              child: Container(
                height: 50.h,
                width: 147.82.w,
                decoration: BoxDecoration(
                  color: color2,
                  borderRadius: BorderRadius.circular(22.r),
                ),
                child: Center(
                  child: Text(
                    'Achievements',
                    style: TextStyle(
                      color: textColor2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
