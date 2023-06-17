// import 'package:hive/hive.dart';

// class QuizResultAdapter extends TypeAdapter<QuizResult> {
//   @override
//   final int typeId = 0;

//   @override
//   QuizResult read(BinaryReader reader) {
//     final id = reader.read();
//     final quizTitle = reader.read();
//     final score = reader.read();

//     return QuizResult(
//       id: id,
//       quizTitle: quizTitle,
//       score: score,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, QuizResult obj) {
//     writer.write(obj.id);
//     writer.write(obj.quizTitle);
//     writer.write(obj.score);
//   }
// }
