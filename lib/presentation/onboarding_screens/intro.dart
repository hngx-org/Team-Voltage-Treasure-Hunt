import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:voltage_treasure_hunt/components/widgets/customButton.dart';
import 'package:voltage_treasure_hunt/presentation/authentication_screens/GoogleSignIn.dart';
import 'package:voltage_treasure_hunt/presentation/authentication_screens/sign_up.dart';
import 'package:voltage_treasure_hunt/presentation/home_screen/home_screen.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
]);

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool isLoading = false;
  final player = AudioPlayer();
  GoogleSignInAccount? currentUser;

  @override
  void initState() {
    super.initState();

    _loadAndPlayAudio();
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

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future<void> _loadAndPlayAudio() async {
    await player.setAsset('assets/audio/homepage.mp3');
    player.setVolume(0.25);
    await player.play();
  }

  Future<void> handleSignIn() async {
    try {
      if (currentUser == null) {
        await _googleSignIn.signIn();
      }

      // Check if the user is signed in again after attempting sign-in
      if (_googleSignIn.currentUser != null) {
        String displayName =
            currentUser?.displayName ?? ''; // Get the display name
        List<String> nameParts = displayName.split(' '); // Split by space
        String firstName =
            nameParts.isNotEmpty ? nameParts[0] : ''; // Take the first part

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              name: '${currentUser?.displayName}', // Use the first name
              email: currentUser?.email ?? '',
              firstName: firstName, // You can provide actual user data here
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
    return Scaffold(
      backgroundColor: Color(0xFF93BED1),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Container(
                  height: 615.h,
                  width: 390.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22).r,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/IMG_4866.JPG'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome to Treasure Tails',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff001532),
                            fontFamily: 'Onest',
                            fontWeight: FontWeight.w600,
                            fontSize: 22.sp,
                          ),
                        ),
                        Text(
                          '☠️',
                          style: TextStyle(
                            color: Color(0xff001532),
                            fontFamily: 'Onest',
                            fontWeight: FontWeight.w700,
                            fontSize: 28.sp,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                              left: 17, right: 17, top: 0, bottom: 10)
                          .r,
                      child: Text(
                        'Customize your avatar, explore maps, and interact with augmented reality objects. Join the hunt, compete on leaderboards, and immerse yourself in an unforgettable adventure. Are you ready to find the hidden treasures in your world?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff001532),
                          fontFamily: 'Onest',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 31.0).r,
                  child: CustomButton(
                    buttonText: 'Sign In with Google',
                    onPressed: () async {
                      setState(() {
                        isLoading =
                            true; // Set isLoading to true before starting the operation.
                      });

                      // Introduce a 2-second delay using Future.delayed.
                      await Future.delayed(Duration(seconds: 2));

                      // Perform the asynchronous operation, e.g., handleSignIn.
                      try {
                        await handleSignIn();
                        await player.stop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Sign In successful.',
                                style: TextStyle(
                                    color: Color(0xff001532),
                                    fontFamily: 'Onest',
                                    fontSize: 14.sp)),
                            backgroundColor: Color(0xff5FCFA3),
                          ),
                        );
                      } catch (error) {
                        // Handle any error that occurred during the operation.
                        // You can show an error message or take appropriate action.
                      } finally {
                        setState(() {
                          isLoading =
                              false; // Set isLoading to false when the operation is done.
                        });
                      }
                    },
                    loading:
                        isLoading, // Pass the isLoading flag to the CustomButton.
                  ),
                )
              ],
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
         
        ],
      ),
    );
  }
}
