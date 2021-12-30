import 'package:flutterquiz/screens/about/about.dart';
import 'package:flutterquiz/screens/home/home.dart';
import 'package:flutterquiz/screens/login/login.dart';
import 'package:flutterquiz/screens/profile/profile.dart';
import 'package:flutterquiz/screens/topics/topics.dart';

var appRoutes = {
  "/": (context) => const HomeScreen(),
  "/about": (context) => const AboutScreen(),
  "/login": (context) => const LoginScreen(),
  "/profile": (context) => const ProfileScreen(),
  "/topics": (context) => const TopicsScreen(),
};
