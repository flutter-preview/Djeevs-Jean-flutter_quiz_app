import 'package:flutter/material.dart';
import 'package:flutter_quiz/_widget/_quiz_screen.dart';
import 'package:flutter_quiz/model/question.dart';
import 'dart:convert';


class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<QuestionModel> questionsModel = [];
  static String filePath = 'assets/conf/conf.json';


  @override
  void initState() {
    super.initState();
    loadQuestionsModel();
  }

  void loadQuestionsModel() async {
    String data = await DefaultAssetBundle.of(context).loadString(filePath);

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
                leading: const Icon(Icons.data_array),
                title: Text(qmodel.quizTitle, style: const TextStyle(fontSize: 16),),
                subtitle: Text(qmodel.file),
              ),
            ),
          );
        },
      );
    }
}