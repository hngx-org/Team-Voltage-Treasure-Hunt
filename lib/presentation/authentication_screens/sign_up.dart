// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
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
          builder: (context) => SignIn(
                name: nameController.text,
                confirmPassword: confirmPasswordController.text,
                createEmail: emailController.text,
              )),
    );

    setState(() {
      isLoading = false;
    });
    await player.stop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Registered Successfully, Sign In with your details.',
            style: TextStyle(
                color: Color(0xff5FCFA3),
                fontFamily: 'Onest',
                fontSize: 14.sp)),
        backgroundColor: Color(0xff001532), // Set the background color to green
      ),
    );
  }

  final player = AudioPlayer();

  void _loadAndPlayAudio() async {
    await player.setAsset('assets/audio/signupscreen.mp3');
    player.setVolume(0.25);
    await player.play();
  }

  @override
  void initState() {
    super.initState();

    _loadAndPlayAudio();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 38.0).r,
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
                      padding: EdgeInsets.fromLTRB(38, 20, 200, 0).r,
                      child: CustomButton(
                        loading: isLoading,
                        buttonText: 'Sign Up',
                        onPressed: () {
                          emailController.text.isEmpty ||
                                  nameController.text.isEmpty ||
                                  passwordController.text.isEmpty ||
                                  confirmPasswordController.text.isEmpty
                              ? ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please, input your details.',
                                      style: TextStyle(
                                        color: Color(0xff5FCFA3),
                                        fontFamily: 'Onest',
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                )
                              : passwordController.text !=
                                      confirmPasswordController.text
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Passwords do not match. Please try again.',
                                          style: TextStyle(
                                            color: Color(0xff5FCFA3),
                                            fontFamily: 'Onest',
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    )
                                  : _signUpAndNavigate();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          // Simulate an API call or registration process.
                          await Future.delayed(Duration(seconds: 1));

                          // After a 4-second delay, navigate to the Sign In screen.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignIn(
                                      name: nameController.text,
                                      confirmPassword:
                                          confirmPasswordController.text,
                                      createEmail: emailController.text,
                                    )),
                          );

                          setState(() {
                            isLoading = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                        await player.stop();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 90.0).r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? Sign in',
                              style: TextStyle(
                                color:  Color(0xFFEED9BF),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Onest',
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 30.r,
                              color: Color(0xFFEED9BF),
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
    );
  }
}
