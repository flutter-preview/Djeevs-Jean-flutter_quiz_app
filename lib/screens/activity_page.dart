import 'package:flutter/material.dart';
import 'package:flutter_quiz/service/service_json.dart';

import 'package:flutter_quiz/model/question.dart';

class ActivityTab extends StatefulWidget {
  const ActivityTab({Key? key}) : super(key: key);

  @override
  State<ActivityTab> createState() => _ActivityTabState();
}

class _ActivityTabState extends State<ActivityTab> {

  Future<List<QuizResult>> quizResultsFuture = QuizResultDatabase.loadQuizResults();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QuizResult>>(
      future: quizResultsFuture,
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
          List<QuizResult> quizResults = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: quizResults.length,
            itemBuilder: (context, index) {
              QuizResult quizResult = quizResults[index];

                  // Format the date manually
              String formattedDate = '${quizResult.date.year}-${quizResult.date.month.toString().padLeft(2, '0')}-${quizResult.date.day.toString().padLeft(2, '0')}';
    


              return ListTile(
                // leading: Icon(Icons.quiz),
                title: Text('Quiz: ${quizResult.quizTitle}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.score),
                        Text('Score: ${quizResult.score}'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.date_range),
                        Text('Date: $formattedDate'),

                        // Text('Date: ${DateFormat('yyyy-MM-dd').format(quizResult.date)}'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.question_answer),
                        Text('Number of questions: ${quizResult.countQuestion}'),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(child: Text('No quiz results found.'),
          );
        }
      },
    );
  }
}
