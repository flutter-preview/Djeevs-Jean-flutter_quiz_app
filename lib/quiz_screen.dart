import 'package:flutter/material.dart';
import 'package:flutter_quiz/models/question.dart';
import 'package:flutter_quiz/_widget/widget_question.dart';
import 'package:flutter_quiz/data/data.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  late final List<Question> listQuestion;
  int _currentQuestionIndex = 0;
  int _currentUser = 0;

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  nextQuestions() {
    if (listQuestion.length > _currentQuestionIndex) {
      setState(() {
      _currentQuestionIndex++;
        
      });
    }
  }

  getQuestions() async {
    final questions = await DataApp.getQuestions();
    setState(() {
      listQuestion = questions;
      print('listQuestion $listQuestion');
    });
  }

  

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = listQuestion[_currentQuestionIndex++];
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          QuestionWidget(question: currentQuestion,),
          ElevatedButton(onPressed: nextQuestions, child: Text("Suivant $currentQuestion"))
        ],
      )
    );
  }


  void getChoice(int value) {
    print('getChoice $value');
    // print('getChoice $goChge');
  }
}