import 'package:flutter/material.dart';
import 'package:flutterquiz/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProfileScreen"),
      ),
      body: ElevatedButton(
        child: const Text("Sign Out"),
        onPressed: () async {
          // Call Sign-Out method from AuthService
          await AuthService().signOut();
          // Reset the navigation stack when user logs out
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        },
      ),
    );
  }
}
