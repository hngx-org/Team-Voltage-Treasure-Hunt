import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          width: double.infinity,
          child: Lottie.asset(
            'assets/animations/animation_lnlicjhd.json',
          ),
        ),
        // 
        Text('Click below to begin your journey!!!',
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
