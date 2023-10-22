// ignore_for_file: file_names, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:voltage_treasure_hunt/presentation/home_screen/home_screen.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
]);

class GoogleSignInHelper extends StatefulWidget {
  const GoogleSignInHelper({super.key});

  @override
  State<GoogleSignInHelper> createState() => _GoogleSignInHelperState();
}

class _GoogleSignInHelperState extends State<GoogleSignInHelper> {
  GoogleSignInAccount? currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        currentUser = account;
      });
      if (currentUser != null) {
        print('user already authenticated');
      }
    });

    _googleSignIn.signInSilently();
  }

  Future<void> handleSignIn() async {
    try {
      if (currentUser == null) {
        await _googleSignIn.signIn();
      }

      // Check if the user is signed in again after attempting sign-in
      if (_googleSignIn.currentUser != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              name: '', // You can provide actual user data here
              email: '', firstName: '', // You can provide actual user data here
            ),
          ),
        );
      }
    } catch (e) {
      print('Sign-in error: $e');
    }
  }

  Future<void> handleSignOut() => _googleSignIn.disconnect();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
