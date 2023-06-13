import 'package:sqflite/sqflite.dart';
import 'package:flutter_quiz/model/question.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class QuizDatabase {
  static final QuizDatabase instance = QuizDatabase._init();
  static Database? _database;

  QuizDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB('quiz.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final intType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE QuizResults (
        id $idType,
        quizTitle $textType,
        score $intType
      )
    ''');
  }

  Future<int> insertQuizResult(QuizResult result) async {
    final db = await instance.database;
    return await db.insert('QuizResults', result.toMap());
  }

  Future<List<QuizResult>> getAllQuizResults() async {
    final db = await instance.database;
    final maps = await db.query('QuizResults');
    return List.generate(maps.length, (i) {
      return QuizResult.fromMap(maps[i]);
    });
  }
}
