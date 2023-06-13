import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/_quiz_screen.dart';
import 'package:flutter_quiz/model/question.dart';

class HomeTab extends StatelessWidget {
  final List<CategoryQuestion> categories = [
    CategoryQuestion(
      name: 'Sports',
      iconData: Icons.sports,
      description: 'Test your sports knowledge!',
    ),
    CategoryQuestion(
      name: 'Religieux',
      iconData: Icons.book,
      description: 'Explore religious trivia!',
    ),
    CategoryQuestion(
      name: 'Science',
      iconData: Icons.science,
      description: 'Discover scientific facts!',
    ),
    // Ajoutez d'autres catégories ici
  ];

  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Nombre de colonnes souhaité
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return InkWell(
          onTap: () {
            // Naviguer vers la page de quiz pour cette catégorie
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuestionListQuestionQuiz(),
                
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
