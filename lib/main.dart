import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterquiz/routes.dart';
import 'package:flutterquiz/screens/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Not called within the build method as we only want to initialize once
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // FutureBuilder used to show different states based on whether or not
    // Firebase is available.
    return MaterialApp(
      home: FutureBuilder(
        // Initialize FlutterFire (Flutter Firebase)
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            // TODO: Add Error Screen
            return Text('Error');
          }

          // Once connected show the application

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: appRoutes,
            );
          }

          // If not connected and no errors then show loading
          // TODO: Add LoadingScreen
          return Text('Loading');
        },
      ),
    );
  }
}
