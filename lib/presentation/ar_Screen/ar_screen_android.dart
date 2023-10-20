// ignore_for_file: depend_on_referenced_packages, unused_element, prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ArScreenAndroid extends StatefulWidget {
  const ArScreenAndroid({super.key});

  @override
  State<ArScreenAndroid> createState() => _ArScreenAndroidState();
}

class _ArScreenAndroidState extends State<ArScreenAndroid> {
  // ArCoreController? arCoreController;
  // arViewController(ArCoreController coreController) {
  //   arCoreController = coreController;

  //   displayTreasureSphere(ArCoreController coreController) async {
  //     final ByteData treasureTextureBytes =
  //         await rootBundle.load('assets/images/IMG_4871.JPG');

  //     final materials = ArCoreMaterial(
  //       color: Color(0xff001532),
  //       textureBytes: treasureTextureBytes.buffer.asUint8List(),
  //     );

  //     final sphere = ArCoreSphere(
  //       materials: [materials],
  //     );
  //     final node = ArCoreNode(shape: sphere, position: vector64.Vector3(0,0,-1.5),);

  //     arCoreController!.addArCoreNode(node);
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                'AR',
                style: TextStyle(
                  color: Color(0xff5FCFA3),
                  fontFamily: 'MooLahLah',
                  fontWeight: FontWeight.w800,
                  fontSize: 35.sp,
                ),
              ),
            ),
          ),
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
      //  ArCoreView(onArCoreViewCreated: arViewController),
    );
  }
}
