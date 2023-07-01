/* import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_quiz/model/question.dart';
import 'package:flutter_quiz/service/service_hive.dart';

class QuizResultStorage {
  late Box<QuizResult> _quizResultBox;

  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(QuizResultAdapter());

    _quizResultBox = await Hive.openBox<QuizResult>('quiz_results');
  }

  Future<void> saveQuizResult(QuizResult quizResult) async {
    await _quizResultBox.add(quizResult);
  }

  List<QuizResult> getQuizResults() {
    return _quizResultBox.values.toList();
  }
}
 */