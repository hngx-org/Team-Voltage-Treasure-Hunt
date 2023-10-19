// ignore_for_file: depend_on_referenced_packages, unused_element, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ArScreenAndroid extends StatefulWidget {
  const ArScreenAndroid({super.key});

  @override
  State<ArScreenAndroid> createState() => _ArScreenAndroidState();
}

class _ArScreenAndroidState extends State<ArScreenAndroid> {
  ArCoreController? arCoreController;
  arViewController(ArCoreController coreController) {
    arCoreController = coreController;

    displayTreasureSphere(ArCoreController coreController) async {
      final ByteData treasureTextureBytes =
          await rootBundle.load('assets/images/IMG_4871.JPG');

      final materials = ArCoreMaterial(
        color: Color(0xff001532),
        textureBytes: treasureTextureBytes.buffer.asUint8List(),
      );

      final sphere = ArCoreSphere(
        materials: [materials],
      );
      final node = ArCoreNode(shape: sphere, position: vector64.Vector3(0,0,-1.5),);

      arCoreController!.addArCoreNode(node);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       ArCoreView(onArCoreViewCreated: arViewController),
    );
  }
}
