import 'package:flutter/material.dart';
import 'package:flutter_quiz/_widget/_widget_question.dart';
import 'dart:convert';
import 'package:flutter_quiz/screens/result/result_screen.dart';

import 'package:flutter_quiz/model/question.dart';

class QuestionListQuestionQuiz extends StatefulWidget {
  final QuestionModel questionModel;
  final List<Question> questions;
  const QuestionListQuestionQuiz({Key? key,  required this.questionModel, required this.questions}) : super(key: key);

  @override
  State<QuestionListQuestionQuiz> createState() => _QuestionListQuestionQuizState();
}

class _QuestionListQuestionQuizState extends State<QuestionListQuestionQuiz> {

  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  int score = 0;
  bool showCorrectAnswer = false;
  bool showNextButton = false;
  double progress = 0.0;

  void checkAnswer() {
    int correctAnswerIndex = widget.questions[currentQuestionIndex].correctAnswerIndex;
    if (selectedAnswerIndex == correctAnswerIndex) {
      score++;
    }
    showCorrectAnswer = true;
    showNextButton = true;
    setState(() {});
  }

  void showNextQuestion() {
    selectedAnswerIndex = null;
    showCorrectAnswer = false;
    showNextButton = false;
    progress = (currentQuestionIndex + 1) / widget.questions.length;

    if (currentQuestionIndex < widget.questions.length - 1) {
      currentQuestionIndex++;
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute( builder: (context) =>
          ResultScreen(score: score, totalQuestions: widget.questions.length, titleQuiz: widget.questionModel.quizTitle),
        ),
      );
    }
    setState(() {});
  }

  double getScorePercentage() {
    double percentage = (score / widget.questions.length) * 100;
    return percentage;
  }

  Future<void> pauseAndContinue() async {
    await Future.delayed(const Duration(seconds: 2));
    showNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: widget.questions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LinearProgressIndicator(value: progress, color: Colors.blue, backgroundColor: Colors.pink),
                const SizedBox(height: 16),
                Text(
                  'Question ${currentQuestionIndex + 1}/${widget.questions.length}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                QuestionSingle(
                  question: widget.questions[currentQuestionIndex],
                  selectedAnswerIndex: selectedAnswerIndex,
                  showCorrectAnswer: showCorrectAnswer,
                  onAnswerSelected: (index) {
                    setState(() {
                      selectedAnswerIndex = index;
                    });
                  },
                ),
                const SizedBox(height: 16),
                if (!showNextButton)
                  ElevatedButton(onPressed: selectedAnswerIndex == null || showCorrectAnswer
                        ? null : () {
                            checkAnswer();
                          },
                    child: const Text('Check Answer'),
                  ),
                const SizedBox(height: 16),
                if (showNextButton)
                  ElevatedButton(onPressed: () {
                      showNextQuestion();
                    },
                    child: const Text('Next Question'),
                  ),
                const SizedBox(height: 16),
              ],
            ),
      ),
    );
  }
}

