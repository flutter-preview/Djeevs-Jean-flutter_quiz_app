/* import 'package:flutter_quiz/adapter/model_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class QuizResultManager {
  final String _boxName = 'quiz_results'; // Nom de la boîte Hive

  Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(QuizResultAdapter());
  }

  Future<Box<QuizResult>> openBox() async {
    final box = await Hive.openBox<QuizResult>(_boxName);
    return box;
  }

  Future<void> closeBox(Box<QuizResult> box) async {
    await box.close();
  }

  Future<void> addQuizResult(QuizResult quizResult) async {
    final box = await openBox();
    await box.add(quizResult);
    await closeBox(box);
  }

  Future<List<QuizResult>> getQuizResults() async {
    final box = await openBox();
    final quizResults = box.values.toList();
    await closeBox(box);
    return quizResults;
  }
}
 */