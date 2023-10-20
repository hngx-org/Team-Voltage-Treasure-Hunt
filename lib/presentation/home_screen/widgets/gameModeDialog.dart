import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voltage_treasure_hunt/presentation/interactive_maps/map_screen.dart';

class GameModeDialog extends StatelessWidget {
  const GameModeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xff001532),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        height: 200.h,
        width: 150.h,
        decoration: BoxDecoration(
            color: Color(0xff001532),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Color.fromARGB(255, 74, 172, 133))),
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            // MapPage()
                            MapScreen()));
              },
              child: Container(
                height: 70.h,
                width: 300.h,
                decoration: BoxDecoration(
                    color: Color(0xff001532),
                    borderRadius: BorderRadius.circular(22),
                    border:
                        Border.all(color: Color.fromARGB(255, 74, 172, 133))),
                child: Center(
                  child: Text('Create Arena',
                      style: TextStyle(
                          color: Color(0xFF73E2B5),
                          fontFamily: 'Onest',
                          fontWeight: FontWeight.w900,
                          fontSize: 25.sp)),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            // MapPage()
                            MapScreen()));
              },
              child: Container(
                height: 70.h,
                width: 300.h,
                decoration: BoxDecoration(
                    color: Color(0xff001532),
                    borderRadius: BorderRadius.circular(22),
                    border:
                        Border.all(color: Color.fromARGB(255, 74, 172, 133))),
                child: Center(
                  child: Text('Explore Arenas',
                      style: TextStyle(
                          color: Color(0xFF73E2B5),
                          fontFamily: 'Onest',
                          fontWeight: FontWeight.w900,
                          fontSize: 25.sp)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
