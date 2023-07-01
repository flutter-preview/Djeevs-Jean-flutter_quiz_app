import 'package:hive/hive.dart';
import 'package:flutter_quiz/adapter/adapter.dart';
import 'package:flutter_quiz/model/question.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class QuizResultData {
  Box<QuizResult>? _box;

  Future<void> initHive() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(QuizResultAdapter());
    _box = await Hive.openBox<QuizResult>('quiz_results');
  }

  Future<void> addQuizResult(QuizResult quizResult) async {
    await _box?.add(quizResult);
  }

  List<QuizResult> getAllQuizResults() {
    return _box?.values.toList() ?? [];
  }

  QuizResult? getQuizResultAtIndex(int index) {
    return _box?.getAt(index);
  }

  Future<void> closeHive() async {
    await _box?.close();
    await Hive.close();
  }
}
