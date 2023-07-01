import 'package:flutter_quiz/model/question.dart';
import 'package:flutter_quiz/sharedprefer/demo.dart';
// import 'package:flutter_quiz/adapter/crud_hive.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_quiz/service/service_json.dart';
import 'package:intl/intl.dart';
class ActivityTab extends StatefulWidget {
  const ActivityTab({Key? key}) : super(key: key);

  @override
  State<ActivityTab> createState() => _ActivityTabState();
}

class _ActivityTabState extends State<ActivityTab> {
  Future<List<QuizResult>> fetchQuizResults() async {
    
    final quizResultData = QuizResultStorage();
    return await quizResultData.getQuizResults();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QuizResult>>(
      future: fetchQuizResults(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          final quizResults = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            itemCount: quizResults.length,
            itemBuilder: (context, index) {
              final quizResult = quizResults[index];
              return ListTile(
                title: Text(
                  'activityname'.tr() + ' : ${quizResult.quizTitle}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.score),
                        Text('Score: ${quizResult.score}%'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.date_range),
                        // Text('Date: ${quizResult.date}'),
                        Text('Date: ${DateFormat('MMM d, h:mm a').format(quizResult.date)}'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.question_answer),
                        Text('${quizResult.countQuestion} questions'),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text('No quiz results found.'),
          );
        }
      },
    );
  }
}
