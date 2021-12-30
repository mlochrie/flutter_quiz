import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Stream used to listen to changes to the Firebase user and act accordingly
  final userStream = FirebaseAuth.instance.authStateChanges();

  // Check authentication state in a certain moment
  final user = FirebaseAuth.instance.currentUser;

  // Anonymous Firebase Login
  Future<void> anonLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      // Catch error to let user know something went wrong (handle the error)
      print(e);
    }
  }

  // Sign-out of firebase
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> googleLogin() async {
    try {
      // Natively bring up a window for the user to sign-in to their account
      final googleUser = await GoogleSignIn().signIn();

      // If user is null then they have unsuccessfully logged in
      if (googleUser == null) return; // exit the function

      // If user exists wait for authentication object
      final googleAuth = await googleUser.authentication;

      // Generate credentials from the authentication object
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once credentials are obtained wait for the signIn method built in to
      // FirebaseAuth
      await FirebaseAuth.instance.signInWithCredential(authCredential);
    } on FirebaseAuthException catch (e) {
      // Catch error to let user know something went wrong (handle the error)
      print(e);
    }
  }
}
