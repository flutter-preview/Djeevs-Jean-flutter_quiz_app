import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/_quiz_screen.dart';
import 'package:flutter_quiz/model/question.dart';
import 'package:flutter_quiz/db/db_question.dart';
import 'dart:convert';
import 'package:flutter_quiz/db/db_json.dart';


class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<QuestionModel> questionsModel = [];

  @override
  void initState() {
    super.initState();
    loadQuestionsModel();
  }

  void loadQuestionsModel() async {
    String data = await DefaultAssetBundle.of(context).loadString('assets/conf/conf.json');
    // await DbJson.saveQuizResult(QuizResult(quizTitle: 'quizTitle', score: 2));

    List<dynamic> jsonData = json.decode(data);
    questionsModel = jsonData.map((item) => QuestionModel.fromJson(item)).toList();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Nombre de colonnes souhaité
      ),
      itemCount: questionsModel.length,
      itemBuilder: (context, index) {
        final qmodel = questionsModel[index];
        return InkWell(
          onTap: () {
            // Naviguer vers la page de quiz pour cette catégorie
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => IndexQuestionList(questionModel: qmodel),
              ),
            );
          },
          child: Card(
            child: ListTile(
                leading: Icon(Icons.data_array),
                title: Text(qmodel.model, style: TextStyle(fontSize: 16),),
                subtitle: Text(qmodel.file),
              ),
            ),
          );
        },
      );
    }
}

/* class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);

  final List<CategoryQuestion> categories = [
    CategoryQuestion(name: 'Sports', iconData: Icons.sports,description: 'Test your sports knowledge!',),
    CategoryQuestion(name: 'Religieux', iconData: Icons.book, description: 'Explore religious trivia!',),
    CategoryQuestion(name: 'Science', iconData: Icons.science, description: 'Discover scientific facts!',),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Nombre de colonnes souhaité
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return InkWell(
          onTap: () {
            // Naviguer vers la page de quiz pour cette catégorie
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => const QuestionListQuestionQuiz(),
              ),
            );
          },
          child: Card(
            child: ListTile(
                leading: Icon(category.iconData),
                title: Text(category.name),
                subtitle: Text(category.description),
              ),
            ),
          );
        },
      );
    }
}
 */