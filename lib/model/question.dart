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

class Score {
  final String category;
  final int score;

  Score({
    required this.category,
    required this.score,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      category: json['category'],
      score: json['score'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'score': score,
    };
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