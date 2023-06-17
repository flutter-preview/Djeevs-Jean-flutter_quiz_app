import 'package:flutter/material.dart';
import 'package:flutter_quiz/model/question.dart';
import 'package:flutter_quiz/service/service_json.dart';
class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String titleQuiz;

  const ResultScreen({Key? key, required this.score, required this.totalQuestions, required this.titleQuiz})  : super(key: key);


  double getScorePercentage() {
    double percentage = (score / totalQuestions) * 100;
    return percentage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              'Score: ${getScorePercentage().toStringAsFixed(1)}%',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            const Text(
              'Congratulations!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final result = QuizResult(quizTitle: titleQuiz, score: double.parse(getScorePercentage().toStringAsFixed(1)));
                await QuizResultDatabase.saveQuizResult(result);
                Navigator.pop(context);
              },
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
