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

  // Retrieves a single quiz document
  Future<Quiz> getQuiz(String quizId) async {
    // Reference to quiz by going to quizzes collection and using quiz id
    var ref = _db.collection('quizzes').doc(quizId);

    // Returns a dynamic map
    var snapshot = await ref.get();

    // Convert map to quiz model, if null return an empty map
    return Quiz.fromJson(snapshot.data() ?? {});
  }

  // Listens to the current user's report document in Firestore
  Stream<Report> streamReport() {
    // Need to know current users id, if they login/logout we need to know
    // So a stream is required to keep track of this
    return AuthService().userStream.switchMap((user) {
      // switchMap gives us access to the user, if the user is not null then we
      // get a reference to the reports collection for the specific user uid
      if (user != null) {
        var ref = _db.collection('reports').doc(user.uid);
        // Map the snapshot to a report model
        return ref.snapshots().map((doc) => Report.fromJson(doc.data()!));
      } else {
        // Default report document, providing a way to listen to document in
        // realtime and update automatically when logged in/logged out
        return Stream.fromIterable([Report()]);
      }
    });
  }

  // Updates the current user's report document after completing the quiz
  Future<void> updateUserReport(Quiz quiz) {
    // Called based on event so current user can be grabbed
    var user = AuthService().user!;
    var ref = _db.collection('reports').doc(user.uid);

    var data = {
      // Uses Firestore to increment the total automatically by 1 or if it does
      // not exist it will create it as 1
      'total': FieldValue.increment(1),

      // Uses Firestore to take the quiz ID and merge the value into a firestore
      // list
      'topics': {
        quiz.topic: FieldValue.arrayUnion([quiz.id])
      }
    };

    // Write to database, non destructive write
    return ref.set(data, SetOptions(merge: true));
  }
}
