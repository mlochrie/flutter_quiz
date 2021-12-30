import 'package:flutter/material.dart';
import 'package:flutterquiz/shared/bottom_nav.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TopicsScreen"),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
