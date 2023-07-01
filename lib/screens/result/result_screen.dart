import 'package:flutter/material.dart';
import 'package:flutter_quiz/model/question.dart';
import 'package:flutter_quiz/main.dart';
import 'package:flutter_quiz/sharedprefer/demo.dart';
import 'package:flutter_quiz/adapter/crud_hive.dart';
class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String titleQuiz;

  const ResultScreen({Key? key, required this.score, required this.totalQuestions, required this.titleQuiz})  : super(key: key);

  void saveScore(int count) async {
    final scores = double.parse(getScorePercentage().toStringAsFixed(1));

    final quizResult = QuizResult(
      quizTitle: titleQuiz,
      score: scores,
      date: DateTime.now(),
      countQuestion: count,
    );

    final quizResultData = QuizResultStorage();
    await quizResultData.saveQuizResult(quizResult);

  }
  double getScorePercentage() {
    double percentage = (score / totalQuestions) * 100;
    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    saveScore(totalQuestions);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Your score: $score / $totalQuestions',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Text(
              'Equivalent: ${getScorePercentage().toStringAsFixed(1)}%',
              style: const TextStyle(fontSize: 20),
            ),
            
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                  (route) => false,
                );
              },
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
