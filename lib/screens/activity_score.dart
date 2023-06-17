import 'package:flutter/material.dart';
import 'package:flutter_quiz/service/service_json.dart';

import 'package:flutter_quiz/model/question.dart';

class ActivityScoreTab extends StatefulWidget {
  const ActivityScoreTab({Key? key}) : super(key: key);

  @override
  State<ActivityScoreTab> createState() => _ActivityScoreTabState();
}

class _ActivityScoreTabState extends State<ActivityScoreTab> {

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
                subtitle: Text('Score: ${result.score}'),
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
