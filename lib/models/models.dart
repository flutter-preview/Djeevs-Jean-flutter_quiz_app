import 'dart:convert';

class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({required this.questionText, required this.options, required this.correctAnswerIndex});

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      questionText: map['questionText'], 
      options: List<String>.from(map['options']), 
      correctAnswerIndex: map['correctAnswerIndex']
    );
  }

  factory Question.fromJson(String json) {
    final map = jsonDecode(json);
    return Question.fromMap(map);
  }
}