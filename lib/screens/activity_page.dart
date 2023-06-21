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
            itemCount: quizResults.length,
            itemBuilder: (context, index) {
              QuizResult result = quizResults[index];
              return ListTile(
                title: Text('Quiz: ${result.quizTitle}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Score: ${result.score}'),
                    Text('Date: ${result.date}'),
                    Text('num questions: ${result.count}'),
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
