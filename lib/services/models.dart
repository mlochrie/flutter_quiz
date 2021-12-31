import 'package:json_annotation/json_annotation.dart';

class Topic {
  // Instance variables for Firestore values
  final String id;
  final String img;
  final List<Quiz> quizzes;
  final String title;

  // Default value assigned to each so values are not nullable
  Topic({
    this.id = '',
    this.img = '',
    this.quizzes = const [],
    this.title = '',
  });

  Topic.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        img = json['img'],
        quizzes = json['quizzes'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'img': img,
        'quizzes': quizzes,
        'title': title,
      };
}

@JsonSerializable()
class Quiz {
  // Instance variables for Firestore values
  final String description;
  final String id;
  final List<Question> questions;
  final String title;
  final String topic;

  // Default value assigned to each so values are not nullable
  Quiz({
    this.description = '',
    this.id = '',
    this.questions = const [],
    this.title = '',
    this.topic = '',
  });
}

@JsonSerializable()
class Report {
  // Instance variables for Firestore values
  String uid;
  int total;
  Map topics;

  // Default value assigned to each so values are not nullable
  Report({
    this.uid = '',
    this.total = 0,
    this.topics = const {},
  });
}

@JsonSerializable()
class Question {
  // Instance variables for Firestore values
  String text;
  List<Option> options;

  // Default value assigned to each so values are not nullable
  Question({
    this.text = '',
    this.options = const [],
  });
}

@JsonSerializable()
class Option {
  // Instance variables for Firestore values
  String value;
  String detail;
  bool correct;

  // Default value assigned to each so values are not nullable
  Option({
    this.value = '',
    this.detail = '',
    this.correct = false,
  });
}
