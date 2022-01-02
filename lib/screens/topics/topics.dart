import 'package:flutter/material.dart';
import 'package:flutterquiz/services/services.dart';
import 'package:flutterquiz/shared/bottom_nav.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: FirestoreService().getTopics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // TODO: Display loading screen
          return CircularProgressIndicator.adaptive();
        } else if (snapshot.hasError) {
          // TODO: Display error screen
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          var topics = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text("TopicsScreen"),
            ),
            bottomNavigationBar: const BottomNavBar(),
            body: GridView.count(
              primary: false,
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              padding: const EdgeInsets.all(20.0),
              children: topics.map((topic) => Text(topic.title)).toList(),
            ),
          );
        } else {
          // No topics have been found
          return const Text('No topics have been found');
        }
      },
    );
  }
}
