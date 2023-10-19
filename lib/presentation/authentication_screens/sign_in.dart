// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voltage_treasure_hunt/components/widgets/customButton.dart';
import 'package:voltage_treasure_hunt/components/widgets/customTextField.dart';
import 'package:voltage_treasure_hunt/components/widgets/text_styles.dart';
import 'package:voltage_treasure_hunt/presentation/home_screen/home_screen.dart';

class SignIn extends StatefulWidget {
  final String name;
  const SignIn({super.key, required this.name});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading = false;
  bool emailCorrectlyFormatted = false;
  bool _obscurePassword = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _signInAndNavigate() async {
    setState(() {
      isLoading = true;
    });

    // Simulate an API call or authentication process.
    await Future.delayed(const Duration(seconds: 4));

    // After a 4-second delay, navigate to the next screen.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          email: emailController.text,
          name: widget.name,
        ),
      ),
    );

    setState(() {
      isLoading = false;
    });

    // Show a SnackBar with a green message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sign In Successful'),
        backgroundColor:
            Colors.transparent, // Set the background color to green
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 165.h,
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
                  SizedBox(
                    height: 55.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38.0).r,
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
                    padding: const EdgeInsets.symmetric(horizontal: 38.0).r,
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
                    height: 115.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(38, 70, 200, 0).r,
                    child: CustomButton(
                      loading: isLoading,
                      buttonText: 'Sign In',
                      onPressed: _signInAndNavigate,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                    name: widget.name,
                                    email: emailController.text,
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 102.0).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '''Don't have an account? Sign Up''',
                            style: TextStyle(
                              color: Color(0xff996C28),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Onest',
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            size: 30.r,
                            color: Color.fromARGB(255, 233, 228, 222),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
