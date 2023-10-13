// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:voltage_treasure_hunt/components/widgets/customButton.dart';
import 'package:voltage_treasure_hunt/components/widgets/customTextField.dart';
import 'package:voltage_treasure_hunt/components/widgets/text_styles.dart';
import 'package:voltage_treasure_hunt/presentation/authentication_screens/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  bool emailCorrectlyFormatted = false;
  bool _obscurePassword = true;
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDDC599),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/IMG_4867.JPG',
                ),
              ),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 170,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Center(
                      child: Text(
                        "Create your Account",
                        style: CustomTextStyles.headerTextStyle,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomTextField(
                      hintText: "john_doe",
                      controller: nameController,
                      label: 'Username',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomTextField(
                      hintText: "someone@example.com",
                      inputType: TextInputType.emailAddress,
                      controller: emailController,
                      label: 'Email Address',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomTextField(
                      obscureText: _obscurePassword,
                      hintText: "Abc123#",
                      controller: passwordController,
                      icon: _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      iconAction: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      label: 'Password',
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomTextField(
                      controller: confirmPasswordController,
                      obscureText: _obscurePassword,
                      hintText: "Abc123#",
                      icon: _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      iconAction: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      label: 'Confirm Password',
                    ),
                  ),
              
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 170, 0),
                    child: CustomButton(
                      loading: isLoading,
                      buttonText: 'Sign Up',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()));
                      },
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
                              builder: (context) => const SignIn()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 102.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? Sign in',
                            style: TextStyle(
                              color: Color(0xff82591B),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Onest',
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            size: 30,
                            color: Color.fromARGB(255, 112, 85, 45),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
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
    );
  }
}
