import 'package:flutter/material.dart';
import 'package:flutterquiz/screens/login/login.dart';
import 'package:flutterquiz/screens/topics/topics.dart';
import 'package:flutterquiz/services/auth.dart';

// Check users authentication state and if they are logged in show the topics
// screen, otherwise show login screen

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // If waiting, still loading data
          return const Text('Loading');
        } else if (snapshot.hasError) {
          // If error, show error screen
          return const Text('Error');
        } else if (snapshot.hasData) {
          // The user must be logged in otherwise snapshot would be null
          return const TopicsScreen();
        } else {
          // The user musn't be logged in as no data
          return const LoginScreen();
        }
      },
    );
  }
}
