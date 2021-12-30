import 'package:firebase_auth/firebase_auth.dart';

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
    }
  }

  // Sign-out of firebase
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
