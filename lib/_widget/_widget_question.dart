import 'package:flutter/material.dart';
import 'package:flutter_quiz/model/question.dart';


class QuestionSingle extends StatelessWidget {
  final Question question;
  final int? selectedAnswerIndex;
  final bool showCorrectAnswer;
  final Function(int) onAnswerSelected;

  const QuestionSingle({super.key, required this.question, required this.selectedAnswerIndex,
    required this.showCorrectAnswer, required this.onAnswerSelected,});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Text(question.category!, style: const TextStyle(fontSize: 18), textAlign: TextAlign.center,),
        const SizedBox(height: 16),
        Text(question.question, style: const TextStyle(fontSize: 20), textAlign: TextAlign.center,),
        const SizedBox(height: 16),

        ...question.options.asMap().entries.map((entry) {
          int optionIndex = entry.key;
          String optionText = entry.value;
          bool isCorrectAnswer = optionIndex == question.correctAnswerIndex;
          bool isSelectedAnswer = optionIndex == selectedAnswerIndex;
          return GestureDetector(
            onTap: () {
              if (!showCorrectAnswer) {
                onAnswerSelected(optionIndex);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: showCorrectAnswer
                    ? isCorrectAnswer
                        ? Colors.green.withOpacity(0.5)
                        : isSelectedAnswer
                            ? Colors.red.withOpacity(0.5)
                            : null
                    : null,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Text(optionText,style: TextStyle( fontSize: 16,
                color: isSelectedAnswer ? Colors.blue : showCorrectAnswer && isCorrectAnswer ? Colors.green : null,),
                ),
                trailing: showCorrectAnswer ? isCorrectAnswer  ? const Icon(Icons.check, color: Colors.green)
                        : isSelectedAnswer ? const Icon(Icons.close, color: Colors.red) : null
                    : null,
              ),
            ),
          );
        }),
        const SizedBox(height: 16),
      ],
    ),
    );
  }
}
