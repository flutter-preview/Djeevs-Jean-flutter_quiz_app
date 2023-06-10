import 'package:flutter/material.dart';
import 'package:flutter_quiz/models/question.dart';
import 'package:flutter_quiz/_widget/widget_option.dart';

class QuestionWidget extends StatefulWidget {
  final Question question;
  // bool goChange = false;


  QuestionWidget({required this.question});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();

}

class _QuestionWidgetState extends State<QuestionWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Text(
          widget.question.questionText,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 16),
        WidgetOption(optionList: widget.question.options, onOptionSelected: handleOptionSelected,),

        // ElevatedButton(
        //   onPressed: verify,
        //   child: Text('Suivant'),
        // ),


      ],
    );
  }

  void handleOptionSelected(int value) {
    // setState(() {
    //   widget.choiceUser = value;
    // });
    print('value $value');
  }

  void verify() {

  }
}
