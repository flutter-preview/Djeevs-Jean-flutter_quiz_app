import 'package:flutter/material.dart';
import 'package:flutter_quiz/models/models.dart';
import 'data/data.dart';

class QuizScreen extends StatefulWidget {
  
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  List<Question> _questions = [];

  int? _selectedAnswerIndex;


  loadQuestion() async {
    _questions = await DataApp.getQuestions();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadQuestion();
  }

   @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    loadQuestion();
  }

  void _nextQuestion() {
    setState(() {
      _selectedAnswerIndex = null;
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Affichez un message de fin du quiz ou faites autre chose lorsque toutes les questions sont terminées.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = _questions[_currentQuestionIndex];
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentQuestion.questionText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: currentQuestion.options.length,
                itemBuilder: (context, index) {
                  String option = currentQuestion.options[index];
                  return ListTile(
                    title: Text(option),
                    leading: Radio<int>(
                      value: index,
                      groupValue: _selectedAnswerIndex,
                      onChanged: (value) {
                        setState(() {
                          _selectedAnswerIndex = value;
                        });
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _nextQuestion,
                child: Text('Suivant'),
              ),
            ],
          ),
      );
  }
}
