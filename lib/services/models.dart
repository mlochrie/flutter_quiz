import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart'; // Represents an automatically generated file

@JsonSerializable() // Decorator
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

  // Tells JsonSerialisable what to do
  // Details here:
  // https://docs.flutter.dev/development/data-and-backend/json
  // Creating model classes the json_serializable way
  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);
}

@JsonSerializable() // Decorator
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

  // Tells JsonSerialisable what to do
  // Details here:
  // https://docs.flutter.dev/development/data-and-backend/json
  // Creating model classes the json_serializable way
  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  Map<String, dynamic> toJson() => _$QuizToJson(this);
}

@JsonSerializable() // Decorator
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

  // Tells JsonSerialisable what to do
  // Details here:
  // https://docs.flutter.dev/development/data-and-backend/json
  // Creating model classes the json_serializable way
  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

@JsonSerializable() // Decorator
class Question {
  // Instance variables for Firestore values
  String text;
  List<Option> options;

  // Default value assigned to each so values are not nullable
  Question({
    this.text = '',
    this.options = const [],
  });

  // Tells JsonSerialisable what to do
  // Details here:
  // https://docs.flutter.dev/development/data-and-backend/json
  // Creating model classes the json_serializable way
  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable() // Decorator
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

  // Tells JsonSerialisable what to do
  // Details here:
  // https://docs.flutter.dev/development/data-and-backend/json
  // Creating model classes the json_serializable way
  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
