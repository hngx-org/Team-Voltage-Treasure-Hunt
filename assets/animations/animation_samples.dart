import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationSamples extends StatelessWidget {
  const AnimationSamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(58.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: Lottie.asset(
                  'assets/animations/animation_lnlhrqad.json',
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Lottie.asset(
                'assets/animations/animation_lnlhwuww.json',
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Lottie.asset(
                'assets/animations/animation_lnlhycab.json',
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Lottie.asset(
                'assets/animations/animation_lnli0zgp.json',
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Lottie.asset(
                'assets/animations/animation_lnli5c9h.json',
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Lottie.asset(
                'assets/animations/animation_lnlicjhd.json',
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Lottie.asset(
                'assets/animations/animation_lnlidbtl.json',
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Lottie.asset(
                'assets/animations/animation_lnlie7v9.json',
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Lottie.asset(
                'assets/animations/animation_lnliglzp.json',
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Lottie.asset(
                'assets/animations/animation_lnllqnl6.json',
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Lottie.asset(
                'assets/animations/animation_lnllqogw.json',
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Lottie.asset(
                'assets/animations/animation_lnllrp0i.json',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
