/* import 'package:flutter/material.dart';
import 'package:flutter_quiz/models/question.dart';
import 'package:flutter_quiz/_widget/widget_question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> _questions = [
    Question(
      questionText: 'Quelle est la capitale de la France ?',
      options: ['Paris', 'Londres', 'Berlin', 'Madrid'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Qui a peint la Mona Lisa ?',
      options: ['Vincent van Gogh', 'Leonardo da Vinci', 'Pablo Picasso', 'Claude Monet'],
      correctAnswerIndex: 1,
    ),
    // Ajoutez plus de questions ici
  ];

  int _currentQuestionIndex = 0;
  int _selectedAnswerIndex = -1;

  void _onAnswerSelected(int answerIndex) {
    setState(() {
      _selectedAnswerIndex = answerIndex;
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        // Réinitialisation de la sélection de réponse uniquement lorsque vous passez à la question suivante
        _selectedAnswerIndex = -1;
      } else {
        // Le quiz est terminé
        // Vous pouvez afficher les résultats ou naviguer vers une autre page
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = _questions[_currentQuestionIndex];

    return Padding(
      padding: EdgeInsets.all(16), 
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QuestionWidget(
              question: currentQuestion,
              onAnswerSelected: _onAnswerSelected,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _selectedAnswerIndex == -1 ? null : _nextQuestion,
              child: Text('Suivant'),
            ),
          ],
      ),
    );
  }
}
 */