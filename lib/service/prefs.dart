// import 'package:flutter_quiz/model/question.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';


// class QuizResultStorage {
//   static Future<void> saveQuizResult(QuizResult result) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> savedResults = prefs.getStringList('quizResults') ?? [];

//     savedResults.add(result.toString());
//     prefs.setStringList('quizResults', savedResults);
//   }

//   static Future<List<QuizResult>> getAllQuizResults() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> savedResults = prefs.getStringList('quizResults') ?? [];

//     return savedResults.map((resultString) {
//       Map<String, dynamic> resultMap = Map.from(jsonDecode(resultString));
//       return QuizResult.fromMap(resultMap);
//     }).toList();
//   }
// }
