// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:voltage_treasure_hunt/components/widgets/customButton.dart';
import 'package:voltage_treasure_hunt/components/widgets/customTextField.dart';
import 'package:voltage_treasure_hunt/components/widgets/text_styles.dart';
import 'package:voltage_treasure_hunt/presentation/authentication_screens/sign_up.dart';
import 'package:voltage_treasure_hunt/presentation/home_screen/home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
            child: SingleChildScrollView(
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
                        "Sign in",
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
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 210, 170, 0),
                    child: CustomButton(
                      loading: isLoading,
                      buttonText: 'Sign In',
                      onPressed: () {
                        String name = nameController.text;
                        String email = emailController.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(name: name, email: email)));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 102.0),
                    // child: InkWell(
                    //   onTap: () => MaterialPageRoute(
                    //             builder: (context) =>
                    //                 SignUp()));
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          ),
                          child: Text(
                            'Already have an account? Sign in',
                            style: TextStyle(
                              color: Color(0xff996C28),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Onest',
                            ),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 30,
                          color: Color(0xFF70552D),
                        )
                      ],
                    ),
                  ),
                  //),
                ],
              ),
            ),
          ),
          Positioned(
            child: Lottie.asset(
              'assets/animations/animation_lnlie7v9.json',
            ),
          )
        ],
      ),
    );
  }
}
