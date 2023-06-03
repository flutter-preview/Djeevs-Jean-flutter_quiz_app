import 'package:flutter_quiz/models/models.dart';
import 'package:flutter_quiz/service/service.dart';

class DataApp {
  static Future<List<Question>> getQuestions() async {
    try {
      final response = await Service.getJsonData();
      List<Question> listQuestions = response.map((e) => Question.fromJson(e)).toList(); 
      return listQuestions;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}