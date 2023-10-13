// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff82591B),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/IMG_4871.JPG',
            ),
          ),
        ),
        child: Center(
          child: Text(
            'Settings',
            style: TextStyle(
              color: Color(0xff5FCFA3),
              fontFamily: 'MooLahLah',
              fontWeight: FontWeight.w800,
              fontSize: 35.sp,
            ),
          ),
        ),

      ),
    );
  }
}
