import 'package:flutter/material.dart';
import 'package:flutter_quiz/models/question.dart';
import 'package:flutter_quiz/_widget/widget_question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Question questionsA = Question(
      questionText: 'Quelle est la capitale de la France ?',
      options: ['Paris', 'Londres', 'Berlin', 'Madrid'],
      correctAnswerIndex: 0,
    );
    

  @override
  Widget build(BuildContext context) {
    return RadioListTile<int>(
          title: Text(questionsA.questionText),
          value: 0,
          groupValue: 0,
          onChanged: (value) {
            setState(() {
            });
          },
    );
  }
}
