import 'package:flutter/material.dart';

class LeaderBoard extends StatelessWidget {
 LeaderBoard({super.key});
int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
  itemCount: itemCount, 
  itemBuilder: (BuildContext context, int index) {

    return ListTile(
      title: Text('Item $index'), // Replace with your actual item data.
    );
  },
);
    // Column(
    //   children: [
    //     SizedBox(
    //       height: 120.h,
    //       width: double.infinity,
    //       child: Lottie.asset(
    //         'assets/animations/animation_lnlicjhd.json',
    //       ),
    //     ),
    //     // 
    //     Text('Click below to begin your journey!!!',
    //     textAlign: TextAlign.center,
    //         style: TextStyle(
    //           color: Color(0xFF73E2B5),
    //           fontFamily: 'Onest',
    //           fontWeight: FontWeight.w900,
    //         )),
    //   ],
    // );
  }
}


// Row(
//           children: [
//             SizedBox(
//               width: 10.h,
//             ),
//             Container(
//               height: 30.h,
//               width: 35.w,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(42),
//                 gradient: LinearGradient(colors: [
//                   Color(0xff001532),
//                   Color.fromARGB(255, 47, 146, 106),
//                 ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//               ),
//             ),
//             SizedBox(
//               width: 5.h,
//             ),
//             Container(
//               height: 30.h,
//               width: 35.w,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(42),
//                 gradient: LinearGradient(colors: [
//                   Color(0xff001532),
//                   Color.fromARGB(255, 47, 146, 106),
//                 ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//               ),
//             ),
//             SizedBox(
//               width: 5.h,
//             ),
//             Container(
//               height: 35.h,
//               width: 240.w,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(42),
//                 gradient: LinearGradient(colors: [
//                   Color(0xff001532),
//                   Color.fromARGB(255, 47, 146, 106),
//                 ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//               ),
//             ),
//           ],
//         ),