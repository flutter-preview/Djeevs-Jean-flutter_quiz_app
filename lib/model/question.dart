import 'package:flutter/material.dart';

class Question {
  String category;
  String question;
  List<String> options;
  int correctAnswerIndex;

  Question({
    required this.category,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
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

  CategoryQuestion({
    required this.name,
    required this.iconData,
    required this.description,
  });
}
