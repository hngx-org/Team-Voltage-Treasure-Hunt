// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voltage_treasure_hunt/components/constants/colors.dart';
import 'package:voltage_treasure_hunt/components/widgets/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.validator,
      required this.hintText,
      required this.label,
      this.controller,
      this.icon,
      this.iconAction,
      this.prefixIcon,
      this.inputType = TextInputType.text,
      this.onChanged,
      this.validateMode = AutovalidateMode.disabled,
      this.obscureText = false,
      this.padding = 10,
      this.readOnly = false})
      : super(key: key);

  final TextEditingController? controller;
  final String label;
  final String hintText;
  final TextInputType inputType;
  final Function(String)? onChanged;
  final bool readOnly;
  final VoidCallback? iconAction;
  final validator;
  final validateMode;
  final bool obscureText;
  final IconData? icon;
  final IconData? prefixIcon;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 8.0).r,
                child: Text(
                  label,
                  style: TextStyle(
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Onest',
                      fontSize: 18.sp,
                      ),
                )),
            const SizedBox(height: 5),
            Container(
              // height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  // color: AppColor.backgroundColor3,
                  border: Border.all(
                      color: AppColor.textColor.withOpacity(0.7)),
                 ),
              child: TextFormField(
                cursorColor: Color(0xff82591B),
                maxLines: obscureText ? 1 : 10,
                minLines: 1,
                obscuringCharacter: '*',
                autovalidateMode: validateMode,
                validator: validator,
                controller: controller,
                keyboardType: inputType,
                readOnly: readOnly,
                obscureText: obscureText,
                style: TextStyle(
                  letterSpacing: 2,
                  color: const Color(0xff82591B),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Onest',
                  fontSize: 14.sp,
                ),
                decoration: InputDecoration(
                    prefixIcon: prefixIcon != null
                        ? Icon(prefixIcon, color: AppColor.textColor)
                        : null,
                    suffixIcon: GestureDetector(
                        onTap: iconAction,
                        child: Icon(
                          icon,
                          color: Color(0xff82591B),
                        )),
                    hintText: hintText,
                    hintStyle: CustomTextStyles.hintStyle,
                    border: myBorder(),
                    focusedBorder: myBorder(),
                    enabledBorder: myBorder()),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder myBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15));
  }
}
