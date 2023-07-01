/* import 'package:hive/hive.dart';
import 'package:flutter_quiz/model/question.dart';
// part 'quiz_result.g.dart';

// @HiveType(typeId: 0)
// class QuizResult {
//   @HiveField(0)
//   final String quizTitle;
//   @HiveField(1) 
//   final double score;
//   @HiveField(2)
//   final int countQuestion;
//   @HiveField(3)
//   final DateTime date;

//   QuizResult({
//     required this.quizTitle,
//     required this.score,
//     required this.date,
//     required this.countQuestion,
//   });
// }


class QuizResultAdapter extends TypeAdapter<QuizResult> {
  @override
  final typeId = 0; // Identifiant unique pour QuizResult

  @override
  QuizResult read(BinaryReader reader) {
    final fields = reader.readMap();
    return QuizResult(
      id: fields['id'] as int,
      quizTitle: fields['quizTitle'] as String,
      score: fields['score'] as double,
      date: DateTime.parse(fields['date'] as String),
      countQuestion: fields['countQuestion'] as int,
    );
  }

  @override
  void write(BinaryWriter writer, QuizResult obj) {
    writer.writeMap({
      'id': obj.id,
      'quizTitle': obj.quizTitle,
      'score': obj.score,
      'date': obj.date.toIso8601String(),
      'countQuestion': obj.countQuestion,
    });
  }
}
 */