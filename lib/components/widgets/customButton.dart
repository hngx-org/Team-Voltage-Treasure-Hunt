// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voltage_treasure_hunt/components/widgets/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonText;
  final Color? buttonTextColor;
  final Color? backgroundColor;
  final double? fontSize;
  final EdgeInsets? padding;
  final double? radius;
  final Widget? buttonWidget;
  final bool loading;

  const CustomButton(
      {super.key,
      this.onPressed,
      this.buttonText,
      this.buttonTextColor,
      this.backgroundColor,
      this.fontSize,
      this.padding,
      this.radius,
      this.buttonWidget,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: !loading ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color(0xff001532),),
          padding: MaterialStatePropertyAll(
            padding ?? const EdgeInsets.all(16),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color:Color(0xff5FCFA3), width: 2),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 22),
            ),
          ),
        ),
        child: !loading
            ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Image.asset('assets/icons/google.png', height: 30.h, width: 30.w,),
               SizedBox(width: 5.w,),
                Text(
                    textAlign: TextAlign.center,
                    buttonText ?? "",
                    style: CustomTextStyles.buttonTextStyle),
              ],
            )
            : SizedBox(
                height: 20.h,
                width: 20.w,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Color(0xff5FCFA3),
                  ),
                ),
              ),
      ),
    );
  }
}
