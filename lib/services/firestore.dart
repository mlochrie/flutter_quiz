import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart'; // Utility functions when dealing with streams
import 'package:flutterquiz/services/auth.dart';
import 'package:flutterquiz/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Reads all documents from topics collection
  // List of Topics (coming from models in models.dart)
  Future<List<Topic>> getTopics() async {
    // Reference to location in database
    var ref = _db.collection('topics');

    // Read collection once, no realtime listener
    var snapshot = await ref.get();

    // Snapshot contains a lot of unnecessary metadata, looped over using map to
    // convert snapshot into raw data
    var data = snapshot.docs.map((s) => s.data());

    // Map the data into a topic
    var topics = data.map((d) => Topic.fromJson(d));

    // Return list of topics
    return topics.toList();
  }

  // TODO: Method to retrieve quiz document
  // Future<Quiz> getQuiz(String quizId) async {}
}
