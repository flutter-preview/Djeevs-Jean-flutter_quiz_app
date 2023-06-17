import 'package:sqflite/sqflite.dart';
import 'package:flutter_quiz/model/question.dart';

import 'package:path/path.dart';

class QuizResultDatabase {
  static const String tableName = 'quiz_results';

  static Future<Database> _openDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'quiz_results.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        quizTitle TEXT,
        score INTEGER
      )
    ''');
  }

  static Future<void> insertQuizResult(QuizResult quizResult) async {
    final db = await _openDatabase();
    await db.insert(tableName, quizResult.toMap());
  }

  static Future<List<QuizResult>> getQuizResults() async {
    final db = await _openDatabase();
    final maps = await db.query(tableName);
    return List.generate(maps.length, (index) {
      return QuizResult.fromMap(maps[index]);
    });
  }

  static Future<void> clearQuizResults() async {
    final db = await _openDatabase();
    await db.delete(tableName);
  }
}
