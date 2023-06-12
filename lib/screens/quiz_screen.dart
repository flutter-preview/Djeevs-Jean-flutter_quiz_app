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
  int? selectedAnswerIndex;
  int score = 0;
  bool showCorrectAnswer = false;

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

  void checkAnswer() {
    int correctAnswerIndex = questions[currentQuestionIndex].correctAnswerIndex;
    if (selectedAnswerIndex == correctAnswerIndex) {
      score++;
    }
    showCorrectAnswer = true;
    setState(() {});
  }

  void showNextQuestion() {
    selectedAnswerIndex = null;
    showCorrectAnswer = false;
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
                Text(
                  'Question ${currentQuestionIndex + 1}/${questions.length}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  questions[currentQuestionIndex].category,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  questions[currentQuestionIndex].question,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                ...questions[currentQuestionIndex].options.asMap().entries.map((entry) {
                  int optionIndex = entry.key;
                  String optionText = entry.value;
                  bool isCorrectAnswer = optionIndex == questions[currentQuestionIndex].correctAnswerIndex;
                  bool isSelectedAnswer = optionIndex == selectedAnswerIndex;
                  return GestureDetector(
                    onTap: () {
                      if (!showCorrectAnswer) {
                        setState(() {
                          selectedAnswerIndex = optionIndex;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: showCorrectAnswer
                            ? isCorrectAnswer
                                ? Colors.green.withOpacity(0.5)
                                : isSelectedAnswer
                                    ? Colors.red.withOpacity(0.5)
                                    : null
                            : null,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        title: Text(
                          optionText,
                          style: TextStyle(
                            fontSize: 16,
                            color: isSelectedAnswer
                                ? Colors.amber
                                : showCorrectAnswer && isCorrectAnswer
                                    ? Colors.green
                                    : null,
                          ),
                        ),
                        trailing: showCorrectAnswer
                            ? isCorrectAnswer
                                ? Icon(Icons.check, color: Colors.green)
                                : isSelectedAnswer
                                    ? Icon(Icons.close, color: Colors.red)
                                    : null
                            : null,
                      ),
                    ),
                  );
                }),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: selectedAnswerIndex == null || showCorrectAnswer ? null : () {
                    checkAnswer();
                    pauseAndContinue();
                  },
                  child: Text('Next'),
                ),
                SizedBox(height: 16),
                Text(
                  'Score: $score/${questions.length}',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
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