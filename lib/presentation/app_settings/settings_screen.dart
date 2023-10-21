// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff82591B),
      body: Stack(
        children: [
          Container(
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
              child: Column(
                children: [
                  SizedBox(
                    height: 45.h,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                        color: Color(0xFF73E2B5),
                        fontFamily: 'MooLahLah',
                        fontWeight: FontWeight.bold,
                        fontSize: 48),
                  ),
                  SizedBox(
                    height: 250.h,
                  ),
                  GestureDetector(
  onTap: () {
    Provider.of<MusicToggle>(context, listen: false).onToggled();

  },
  child: Consumer<MusicToggle>(
    builder: (context, musicToggle, child) {
      return musicToggle.isToggled
          ? Icon(
                Icons.music_note, 
              color: Color(0xFF73E2B5),
              size: 100.r,
            )
          : Icon(
           Icons.music_off,
              color: Color(0xFF73E2B5),
              size: 100.r,
            );
    },
  ),
),
                ],
              )),
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
      ),
    );
  }
}

class MusicToggle extends ChangeNotifier {
  bool isToggled = true;
  void onToggled() {
    isToggled = !isToggled;
    notifyListeners();
  }
}
