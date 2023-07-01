import 'package:hive/hive.dart';
import 'package:flutter_quiz/model/question.dart';

class QuizResultAdapter extends TypeAdapter<QuizResult> {
  @override
  final typeId = 0; // Identifiant unique pour votre modèle

  @override
  QuizResult read(BinaryReader reader) {
    // Logique de désérialisation
    return QuizResult(
      id: reader.read(),
      quizTitle: reader.read(),
      score: reader.read(),
      countQuestion: reader.read(),
      date: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, QuizResult obj) {
    // Logique de sérialisation
    writer.write(obj.id);
    writer.write(obj.quizTitle);
    writer.write(obj.score);
    writer.write(obj.countQuestion);
    writer.write(obj.date);
  }
}
