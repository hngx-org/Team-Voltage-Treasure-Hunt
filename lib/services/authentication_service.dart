import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
/*
This class handles google sign in. To use the google sign in functionality, you can call the method using the example below
    UserCredential user = await AuthService().signInWithGoogle();

Dont forget to import the authentication_service file, and the google_sign_in to remove errors.
now you can use if statements to check if the sign in was successful and if its successful you can extract user data like the email address like the code example below
     if(user != null){
        String userEmail = user.user?.email;
      }
 You can also use the other function to extract username from the email
      String username = getUsernameFromEmail(userEmail);
 */
  Future<UserCredential> signInWithGoogle()async{
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
    );
    UserCredential user = await FirebaseAuth.instance.signInWithCredential(credentials);
    return user;
  }
  String getUsernameFromEmail(String email){
    List parts = email.split('@');
    return parts[0];
  }
}