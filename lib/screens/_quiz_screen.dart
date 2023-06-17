import 'package:flutter/material.dart';
import 'package:flutter_quiz/_widget/widget_question.dart';
import 'dart:convert';
import 'package:flutter_quiz/screens/result_screen.dart';

import 'package:flutter_quiz/model/question.dart';

class IndexQuestionList extends StatelessWidget {
  final QuestionModel questionModel;
  const IndexQuestionList({Key? key, required this.questionModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(questionModel.model),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone'),
                ),
                // Ajoutez d'autres listTiles pour plus d'icônes
              ],
            ),
          ),
          Spacer(),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => QuestionListQuestionQuiz(questionModel: questionModel),
            ));
          }, child: const Text('Check Answer'),),
        ],
      ),
      )
    );
  }

 
}

class QuestionListQuestionQuiz extends StatefulWidget {
  final QuestionModel questionModel;
  const QuestionListQuestionQuiz({Key? key,  required this.questionModel}) : super(key: key);

  @override
  State<QuestionListQuestionQuiz> createState() => _QuestionListQuestionQuizState();
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
    String data = await DefaultAssetBundle.of(context).loadString('assets/languages/${widget.questionModel.file}.json');
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
      Navigator.pushReplacement(context, MaterialPageRoute( builder: (context) =>
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
        child: questions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LinearProgressIndicator(value: progress, color: Colors.pink,),
                const SizedBox(height: 16),
                Text(
                  'Question ${currentQuestionIndex + 1}/${questions.length}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
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

