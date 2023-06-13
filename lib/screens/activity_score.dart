import 'package:flutter/material.dart';
import 'package:flutter_quiz/service/service_manager.dart';
import 'package:flutter_quiz/service/service_sql.dart';
import 'package:flutter_quiz/model/question.dart';

class ActivityScoreTab extends StatefulWidget {
  const ActivityScoreTab({Key? key}) : super(key: key);

  @override
  State<ActivityScoreTab> createState() => _ActivityScoreTabState();
}

class _ActivityScoreTabState extends State<ActivityScoreTab> {
  // late Future<List<QuizResult>>? allResults;

  // loadQuizResults() async {
  //   List<QuizResult> all = await QuizDatabase.instance.getAllQuizResults();
  //   setState(() {
  //     allResults = Future.value(all);
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   loadQuizResults();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('About Page'),
    );
  }
}
