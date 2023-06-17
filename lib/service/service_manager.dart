// import 'dart:convert';
// import 'package:flutter_quiz/model/question.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ScoreManager {
//   static const String _keyScores = 'scores';

//   static Future<List<Score>> getScores() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? scoresJson = prefs.getString(_keyScores);
//     if (scoresJson != null) {
//       List<dynamic> scoresData = json.decode(scoresJson);
//       List<Score> scores = scoresData.map((data) => Score.fromJson(data)).toList();
//       return scores;
//     } else {
//       return [];
//     }
//   }

//   static Future<void> addScore(Score score) async {
//     List<Score> scores = await getScores();
//     scores.add(score);
//     String scoresJson = json.encode(scores);
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_keyScores, scoresJson);
//   }
// }
