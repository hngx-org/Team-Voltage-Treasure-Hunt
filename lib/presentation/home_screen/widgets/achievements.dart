// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Achievements extends StatelessWidget {
  const Achievements({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.hourglass_empty_rounded,
          color: Color(0xFF73E2B5),
          size: 100.r,
        ),
        SizedBox(height: 20.h,),
        Text('No treasure? click below to win!!!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF73E2B5),
              fontFamily: 'Onest',
              fontWeight: FontWeight.w900,
            )),
      ],
    );
    
  }
}
