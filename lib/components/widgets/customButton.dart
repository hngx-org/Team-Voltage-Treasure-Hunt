// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voltage_treasure_hunt/components/widgets/text_styles.dart';

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
      height: 60.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: !loading ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color(0xff82591B)),
          padding: MaterialStatePropertyAll(
            padding ?? const EdgeInsets.all(16),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: Color(0xffDCC18C), width: 2),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 22),
            ),
          ),
        ),
        child: !loading
            ? Text(
                textAlign: TextAlign.center,
                buttonText ?? "",
                style: CustomTextStyles.buttonTextStyle)
            : SizedBox(
                height: 20.h,
                width: 20.w,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    Color(0xffDCC18C),
                  ),
                ),
              ),
      ),
    );
  }
}
