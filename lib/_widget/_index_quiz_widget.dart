import 'package:flutter/material.dart';
import 'package:flutter_quiz/_widget/_quiz_screen.dart';

import 'package:flutter_quiz/model/question.dart';

class IndexWidgetQuiz extends StatelessWidget {
  final QuestionModel questionModel;
  const IndexWidgetQuiz({Key? key, required this.questionModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(questionModel.quizTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          /* Card(
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
          ), */
          const Spacer(),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => QuestionListQuestionQuiz(questionModel: questionModel),
            ));
          }, child: const Text('Start new quiz'),),
        ],
      ),
      )
    );
  } 
}

