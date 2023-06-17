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
  final int score;

  QuizResult({required this.quizTitle, required this.score});

  Map<String, dynamic> toMap() {
    return {
      'quizTitle': quizTitle,
      'score': score,
    };
  }

  factory QuizResult.fromMap(Map<String, dynamic> map) {
    return QuizResult(
      // id: map['id'],
      quizTitle: map['quizTitle'],
      score: map['score'],
    );
  }
}

class QuestionModel {
  String model;
  String file;

  QuestionModel({required this.model, required this.file});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      model: json['question_model'],
      file: json['file'],
    );
  }
}