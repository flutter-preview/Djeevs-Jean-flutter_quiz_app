import 'package:flutter/material.dart';

class Question {
  String? category;
  String question;
  List<String> options;
  int correctAnswerIndex;

  Question({this.category, required this.question, required this.options, required this.correctAnswerIndex,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      category: json['category'],
      question: json['question'],
      options: List<String>.from(json['options']),
      correctAnswerIndex: json['correctAnswerIndex'],
    );
  }
}

class CategoryQuestion {
  final String name;
  final IconData iconData;
  final String description;

  CategoryQuestion({required this.name, required this.iconData,
    required this.description,
  });
}

class QuizResult {
  // final int? id;
  final String quizTitle;
  final double score;
  final DateTime date;

  QuizResult({required this.quizTitle, required this.score, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'quizTitle': quizTitle,
      'score': score,
      'date':date.toIso8601String()
    };
  }

  factory QuizResult.fromMap(Map<String, dynamic> map) {
    return QuizResult(
      // id: map['id'],
      quizTitle: map['quizTitle'],
      score: map['score'],
      date: DateTime.parse(map['date']),
    );
  }
}

class QuestionModel {
  String quizTitle;
  String file;

  QuestionModel({required this.quizTitle, required this.file});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      quizTitle: json['quizTitle'],
      file: json['file'],
    );
  }
}