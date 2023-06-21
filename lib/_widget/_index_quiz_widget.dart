import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/_widget/_quiz_screen.dart';

import 'package:flutter_quiz/model/question.dart';

// class IndexWidgetQuiz extends StatelessWidget {
//   final QuestionModel questionModel;
//   const IndexWidgetQuiz({Key? key, required this.questionModel}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(questionModel.quizTitle),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
//         child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
          
//           /* Card(
//             child: Column(
//               children: const [
//                 ListTile(
//                   leading: Icon(Icons.email),
//                   title: Text('Email'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.phone),
//                   title: Text('Phone'),
//                 ),
//                 // Ajoutez d'autres listTiles pour plus d'icônes
//               ],
//             ),
//           ), */
//           const Spacer(),
//           ElevatedButton(onPressed: () {
//             Navigator.push(context, MaterialPageRoute(
//               builder: (context) => QuestionListQuestionQuiz(questionModel: questionModel),
//             ));
//           }, child: const Text('Start new quiz'),),
//         ],
//       ),
//       )
//     );
//   } 
// }

class QuestionSelectionPage extends StatefulWidget {
  final QuestionModel questionModel;

  QuestionSelectionPage({
    required this.questionModel,
  });

  @override
  _QuestionSelectionPageState createState() => _QuestionSelectionPageState();
}


class _QuestionSelectionPageState extends State<QuestionSelectionPage> {
  double _selectedQuestion = 10.0;
  List<Question> questions = [];
  static String filePath = 'assets/languages/';
  int maxQuestionCount = 11;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  void loadQuestions() async {
  String data = await DefaultAssetBundle.of(context).loadString('$filePath${widget.questionModel.file}.json');
  List<dynamic> jsonData = json.decode(data);
  questions = jsonData.map((item) => Question.fromJson(item)).toList();

  // Shuffle the list of questions
  questions.shuffle(Random());

  setState(() {
    maxQuestionCount = questions.length;
  });
}

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonDisabled = _selectedQuestion == 0 || _selectedQuestion > maxQuestionCount;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - ${widget.questionModel.quizTitle}'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 15,),
            Text(
              'Select the number of questions:',
              style: TextStyle(fontSize: 16),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.blue,
                inactiveTrackColor: Colors.grey,
                thumbColor: Colors.blue,
                overlayColor: Colors.blue.withOpacity(0.3),
                valueIndicatorColor: Colors.blue,
              ),
              child: Slider(
                value: _selectedQuestion,
                min: 0,
                max: maxQuestionCount.toDouble(),
                divisions: maxQuestionCount,
                label: _selectedQuestion.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _selectedQuestion = value;
                  });
                },
              ),
            ),

          Text("Nombre de question $_selectedQuestion"),
          const Spacer(),
            ElevatedButton(
              onPressed: isButtonDisabled
                  ? null
                  : () {
                      var selectedQuestions = questions.sublist(0, _selectedQuestion.toInt());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionListQuestionQuiz(
                            questionModel: widget.questionModel,
                            questions: selectedQuestions,
                          ),
                        ),
                      );
                    },
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

/* 

class QuestionSelectionPage extends StatefulWidget {
  final QuestionModel questionModel;

  QuestionSelectionPage({
    required this.questionModel,
  });

  @override
  _QuestionSelectionPageState createState() => _QuestionSelectionPageState();
}

class _QuestionSelectionPageState extends State<QuestionSelectionPage> {
  double _selectedQuestion = 10.0;
  List<Question> questions = [];
  static String filePath = 'assets/languages/';
  late int maxQuestionCount; 

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  void loadQuestions() async {
    String data = await DefaultAssetBundle.of(context).loadString('$filePath${widget.questionModel.file}.json');
    List<dynamic> jsonData = json.decode(data);
    questions = jsonData.map((item) => Question.fromJson(item)).toList();
    maxQuestionCount = questions.length;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonDisabled =
        _selectedQuestion == 0 || _selectedQuestion > maxQuestionCount;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - ${widget.questionModel.quizTitle}'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select the number of questions:',
              style: TextStyle(fontSize: 16),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.blue,
                inactiveTrackColor: Colors.grey,
                thumbColor: Colors.blue,
                overlayColor: Colors.blue.withOpacity(0.3),
                valueIndicatorColor: Colors.blue,
              ),
              child: Slider(
                value: _selectedQuestion,
                min: 0,
                max: maxQuestionCount.toDouble(),
                divisions: maxQuestionCount,
                label: _selectedQuestion.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _selectedQuestion = value;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: isButtonDisabled
                  ? null
                  : () {
                      int selectedQuestionCount = _selectedQuestion.round();
                      
                      // Naviguer vers la page du quiz avec le nombre de questions sélectionné
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) => QuestionListQuestionQuiz(questionModel: questionModel),
                      // ));
                    },
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
 */


class RangeSliderExample extends StatefulWidget {
  @override
  _RangeSliderExampleState createState() => _RangeSliderExampleState();
}

class _RangeSliderExampleState extends State<RangeSliderExample> {
  double _startValue = 25.0;
  double _endValue = 75.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Range Slider Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Start Value: $_startValue'),
            Text('End Value: $_endValue'),
            RangeSlider(
              values: RangeValues(_startValue, _endValue),
              min: 0.0,
              max: 100.0,
              onChanged: (RangeValues values) {
                setState(() {
                  _startValue = values.start;
                  _endValue = values.end;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

