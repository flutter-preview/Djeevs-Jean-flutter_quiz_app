import 'package:flutter/material.dart';
import 'package:flutter_quiz/_widget/widget_question.dart';
import 'dart:convert';

import 'package:flutter_quiz/model/question.dart';

class QuestionListQuestionQuiz extends StatefulWidget {
  @override
  _QuestionListQuestionQuizState createState() =>
      _QuestionListQuestionQuizState();
}

class _QuestionListQuestionQuizState extends State<QuestionListQuestionQuiz> {
  List<Question> questions = [];
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  int score = 0;
  bool showCorrectAnswer = false;
  bool showNextButton = false;
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  void loadQuestions() async {
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/questions.json');
    List<dynamic> jsonData = json.decode(data);
    questions = jsonData.map((item) => Question.fromJson(item)).toList();
    setState(() {});
  }

  void checkAnswer() {
    int correctAnswerIndex = questions[currentQuestionIndex].correctAnswerIndex;
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
    progress = (currentQuestionIndex + 1) / questions.length;

    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultScreen(score: score, totalQuestions: questions.length),
        ),
      );
    }
    setState(() {});
  }

  double getScorePercentage() {
    double percentage = (score / questions.length) * 100;
    return percentage;
  }

  Future<void> pauseAndContinue() async {
    await Future.delayed(Duration(seconds: 2));
    showNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: questions.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  color: Colors.pink,
                ),
                SizedBox(height: 16),
                Text(
                  'Question ${currentQuestionIndex + 1}/${questions.length}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                QuestionSingle(
                  question: questions[currentQuestionIndex],
                  selectedAnswerIndex: selectedAnswerIndex,
                  showCorrectAnswer: showCorrectAnswer,
                  onAnswerSelected: (index) {
                    setState(() {
                      selectedAnswerIndex = index;
                    });
                  },
                ),
                SizedBox(height: 16),
                if (!showNextButton)
                  ElevatedButton(
                    onPressed: selectedAnswerIndex == null || showCorrectAnswer
                        ? null
                        : () {
                            checkAnswer();
                          },
                    child: Text('Check Answer'),
                  ),
                SizedBox(height: 16),
                if (showNextButton)
                  ElevatedButton(
                    onPressed: () {
                      showNextQuestion();
                    },
                    child: Text('Next Question'),
                  ),
                SizedBox(height: 16),
              ],
            ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ResultScreen({required this.score, required this.totalQuestions});

  double getScorePercentage() {
    double percentage = (score / totalQuestions) * 100;
    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              'Score: ${getScorePercentage().toStringAsFixed(1)}%',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Congratulations!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
