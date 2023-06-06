import 'package:flutter/material.dart';
import 'package:flutter_quiz/models/models.dart';
import 'data/data.dart';

class QuizScreen extends StatefulWidget {
  // final List<Question> questions;

  // QuizScreen({required this.questions});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentPageIndex = 0;

    List<Question> questions = [];

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    loadQuestion();
  }

  loadQuestion() async {
    questions = await DataApp.getQuestions();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: PageView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          Question question = questions[index];
          return _buildQuestionPage(question);
        },
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildQuestionPage(Question question) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.questionText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            itemCount: question.options.length,
            itemBuilder: (context, optionIndex) {
              String option = question.options[optionIndex];
              return ListTile(
                title: Text(option),
                leading: Radio(
                  value: optionIndex,
                  groupValue: null, // TODO: Pass the selected value here
                  onChanged: null, // TODO: Implement onChanged to handle selection
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


// class QuizScreen extends StatefulWidget {
//   const QuizScreen({Key? key});

//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   List<Question> questions = [];

//   @override
//   void setState(VoidCallback fn) {
//     // TODO: implement setState
//     super.setState(fn);
//     loadQuestion();
//   }

//   loadQuestion() async {
//     questions = await DataApp.getQuestions();
//   }

//   int _currentPageIndex = 0;


//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(questions[0].questionText.toString()),
//       // child: WidgetOption(options: questions[0].options, onClickedOption: () {},),
//       // child: PageView(
//       // children: [Text("1"), ]
//       // ),
//     );
//     // return PageView.builder(
//     //   itemCount:  questions.length,
//     //   itemBuilder: (context, index) {
//     //     Question question = questions[index];
//     //     return WidgetQuestion(question: question);
//     //   },

//     //   // onPageChanged: (index) {
//     //   //   setState(() {
//     //   //     _currentPageIndex = index;
//     //   //   });
//     //   // },
//     // );
//   }
// }


// class WidgetQuestion extends StatefulWidget {
//   final Question question;
//   const WidgetQuestion({super.key, required this.question});

//   @override
//   State<WidgetQuestion> createState() => _WidgetQuestionState();
// }

// class _WidgetQuestionState extends State<WidgetQuestion> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(question.questionText, style: const TextStyle(fontSize: 22),),
//         WidgetOption(options: widget.question.options, onClickedOption: () {}),
//       ],
//     );
//   }
// }



// class WidgetOption extends StatefulWidget {
//   final List<String> options;
//   final VoidCallback onClickedOption;
//   const WidgetOption({super.key, required this.options, required this.onClickedOption});

//   @override
//   State<WidgetOption> createState() => _WidgetOptionState();
// }

// class _WidgetOptionState extends State<WidgetOption> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       // onTap: () => widget.onClickedOption(widget.options),
//       child: Container(
//         height: 50,
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.grey.shade200,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: Colors.grey)
//         ),
//         child: Row(
//           children: widget.options.map((e) => Text(e, style: const TextStyle(fontSize: 22),)).toList(),
//         ),
//       ),
//     );
//   }

// }
