// import 'package:sqflite/sqflite.dart';
// import 'package:flutter_quiz/model/question.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// import 'package:path/path.dart';


// class QuizResultDatabase {
//   late Database _database;

//   Future<void> open() async {
//     // Récupérer le répertoire d'accès aux fichiers de l'application
//     final databasePath = await getDatabasesPath();
//     final path = join(databasePath, 'quiz_results.db'); // Chemin de la base de données

//     // Ouvrir la base de données
//     _database = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) {
//         // Créer la table pour les quiz results
//         return db.execute(
//           '''
//           CREATE TABLE quiz_results(
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             quizTitle TEXT,
//             score INTEGER
//           )
//           ''',
//         );
//       },
//     );
//   }

//   Future<int> insertQuizResult(QuizResult quizResult) async {
//     return await _database.insert('quiz_results', quizResult.toMap());
//   }

//   Future<List<QuizResult>> getAllQuizResults() async {
//     final List<Map<String, dynamic>> maps = await _database.query('quiz_results');
//     return List.generate(maps.length, (index) {
//       return QuizResult.fromMap(maps[index]);
//     });
//   }

//   Future<void> close() async {
//     await _database.close();
//   }
// }
