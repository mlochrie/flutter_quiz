import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Stream used to listen to changes to the Firebase user and act accordingly
  final userStream = FirebaseAuth.instance.authStateChanges();

  // Check authentication state in a certain moment
  final user = FirebaseAuth.instance.currentUser;
}
