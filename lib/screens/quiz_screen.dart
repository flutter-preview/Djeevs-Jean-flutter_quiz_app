import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_quiz/model/question.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questions = [];
  int currentQuestionIndex = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  void loadQuestions() async {
    String data = await DefaultAssetBundle.of(context).loadString('assets/questions.json');
    List<dynamic> jsonData = json.decode(data);
    questions = jsonData.map((item) => Question.fromJson(item)).toList();
    setState(() {});
  }

  void checkAnswer(int selectedIndex) {
    if (selectedIndex == questions[currentQuestionIndex].correctAnswerIndex) {
      score++;
    }
    showNextQuestion();
  }

  void showNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
    } else {
      // Quiz finished, show results screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(score: score, totalQuestions: questions.length),
        ),
      );
    }
    setState(() {});
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
              children: [
                Text(
                  'Question ${currentQuestionIndex + 1}/${questions.length}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  questions[currentQuestionIndex].category,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  questions[currentQuestionIndex].question,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 16),
                ...questions[currentQuestionIndex].options.map((option) {
                  int index = questions[currentQuestionIndex].options.indexOf(option);
                  return ElevatedButton(
                    onPressed: () => checkAnswer(index),
                    child: Text(option),
                  );
                }),
                SizedBox(height: 16),
                Text(
                  'Score: $score/${questions.length}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ResultScreen({required this.score, required this.totalQuestions});

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
            Text(
              'Score: $score/$totalQuestions',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Congratulations!',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
