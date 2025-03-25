import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      bool isAnswerCorrect = chosenAnswers[i] == questions[i].answers[0];
      Color circleColor = isAnswerCorrect ? const Color.fromARGB(255, 107, 198, 255) : const Color.fromARGB(255, 244, 54, 108);

      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
          'circle_color': circleColor, 
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // Calculate correct answers count here
    final int correctAnswersCount = calculateCorrectAnswersCount();

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswersCount out of ${chosenAnswers.length} questions correctly',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: 
              getSummaryData()), //Replaced with all the answers/questions
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Restart Quiz',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int calculateCorrectAnswersCount() {
    int correctAnswersCount = 0;

    for (var i = 0; i < chosenAnswers.length; i++) {
      if (chosenAnswers[i] == questions[i].answers[0]) {
        correctAnswersCount++;
      }
    }

    return correctAnswersCount;
  }
}
