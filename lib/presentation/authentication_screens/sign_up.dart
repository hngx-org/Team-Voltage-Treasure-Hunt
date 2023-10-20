// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:voltage_treasure_hunt/components/widgets/customButton.dart';
import 'package:voltage_treasure_hunt/components/widgets/customTextField.dart';
import 'package:voltage_treasure_hunt/components/widgets/text_styles.dart';
import 'package:voltage_treasure_hunt/presentation/authentication_screens/sign_in.dart';
import 'package:voltage_treasure_hunt/presentation/home_screen/home_screen.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  bool _obscurePassword = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void _signUpAndNavigate() async {
    setState(() {
      isLoading = true;
    });

    // Simulate an API call or registration process.
    await Future.delayed(const Duration(seconds: 4));

    // After a 4-second delay, navigate to the Sign In screen.
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomePage(
                name: nameController.text,
                email: emailController.text,
              )),
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffDDC599),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/IMG_4867.JPG'),
                ),
              ),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 165.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.0).r,
                        child: Center(
                          child: Text(
                            "Create your Account",
                            style: CustomTextStyles.headerTextStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 38.0).r,
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
                        padding: EdgeInsets.symmetric(horizontal: 38.0).r,
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
                        padding: EdgeInsets.symmetric(horizontal: 38.0).r,
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
                      CustomButton(
                        loading: isLoading,
                        buttonText: 'Sign Up',
                        onPressed: _signUpAndNavigate,
                      ),
                      SizedBox(width: 5.w),
                      SizedBox(
                        height: 10.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });

                                try {
                                  // Simulate an API call or registration process.
                                  await Future.delayed(Duration(seconds: 4));

                                  // After a 4-second delay, navigate to the Sign In screen.
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn(
                                              name: nameController.text,
                                            )),
                                  );

                                  setState(() {
                                    isLoading = false;
                                  });
                                } catch (e) {
                                  print(e);
                                }
                              },
                        child: Padding(
                          padding: EdgeInsets.only(right: 90.0).r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? Sign in',
                                style: TextStyle(
                                  color: Color(0xFFFDF3E5),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Onest',
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                size: 30.r,
                                color: Color(0xFFFDF3E5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
              bottom: 100.r,
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
      ),
    );
  }

}
