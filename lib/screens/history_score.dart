import 'package:flutter/material.dart';
import 'package:flutter_quiz/service/service_manager.dart';
import 'package:flutter_quiz/model/question.dart';

class HistoryScoreTab extends StatelessWidget {
  const HistoryScoreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Score>>(
      future: ScoreManager.getScores(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Failed to load scores.'),
          );
        } else {
          List<Score> scores = snapshot.data ?? [];
          if (scores.isEmpty) {
            return const Center(
              child: Text('No scores available.'),
            );
          } else {
            return ListView.builder(
              itemCount: scores.length,
              itemBuilder: (context, index) {
                Score score = scores[index];
                return ListTile(
                  title: Text(score.category),
                  subtitle: Text('Score: ${score.score}'),
                );
              },
            );
          }
        }
      },
    );
  }
}